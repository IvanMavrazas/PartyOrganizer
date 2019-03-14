//
//  PartyMemberPreviewScreen.swift
//  Party Organizer
//
//  Created by Ivan Mavrazas on 2/11/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit
import Kingfisher

protocol MembersSavedDelegate: class {
    func partyMembersSaved(addedMembers: [Member]?)
}

class PartyMemberPreviewScreen: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var delegate: MembersSavedDelegate?
    var data: Object? {
        didSet {
            memberTableView.reloadData()
        }
    }
    
    var members = [Member]()
    
    @IBOutlet weak var memberTableView: UITableView!
    
    //Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memberTableView.allowsMultipleSelection = true
        memberTableView.delegate = self
        memberTableView.dataSource = self
        setupNavigationBar()
        memberTableView.register(UINib(nibName: "MemberTableViewCell", bundle: nil), forCellReuseIdentifier: "MemberTableViewCell")
        
        fetchData()
    }
    
    
    func setupNavigationBar() {
        let title = "Members"
        navigationItem.title = title
    }
    
    //MARK - TableView DataSource Methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberTableViewCell", for: indexPath) as! MemberTableViewCell
        
        cell.delegate = self
        cell.accessoryType = .none
        
        if let profiles = data?.profiles[indexPath.row] {
            cell.profile = profiles
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let profiles = data?.profiles.count {
            return profiles
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
    
    
    //MARK: TableView Delegate methods
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
       memberTableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
     
        
        if let profiles = data?.profiles[indexPath.item].username {
            let member = Member(memberName: profiles, checked: true)
            members.append(member)
        }
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

        memberTableView.cellForRow(at: indexPath)?.accessoryType = .none
        
    }
    //MARK: SaveButtonPressed
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        
        delegate?.partyMembersSaved(addedMembers: members)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: Fetch data
    
    func fetchData() {
        guard let url = URL(string: "http://api-coin.quantox.tech/profiles.json") else { return }
        print("url je \(url)")
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil { return }
            
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            if !(200..<300).contains(httpResponse.statusCode) { return }
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            do {
                let object = try decoder.decode(Object.self, from: data)
                DispatchQueue.main.async {
                    self.data = object
                }
            }
            catch {
                DispatchQueue.main.async {
                    print("ERROR \(error.localizedDescription)")
                    debugPrint(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
}


extension PartyMemberPreviewScreen: MemberTableViewCellDelegate {
    func didTapImage(cell: MemberTableViewCell) {
        guard let indexPath = self.memberTableView.indexPath(for: cell) else { return }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let profileVC = storyboard.instantiateViewController(withIdentifier: "ProfileScreen") as!ProfileScreen
        let profiles = data?.profiles[indexPath.row]
        profileVC.profiles = profiles
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
    
    
}

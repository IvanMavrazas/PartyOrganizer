//
//  PartyMemberPreviewScreen.swift
//  Party Organizer
//
//  Created by Ivan Mavrazas on 2/11/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire
import SwiftyJSON

class PartyMemberPreviewScreen: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var data: Object? {
        didSet {
            memberTableView.reloadData()
        }
    }
    var member: Member?
    var members = [Member]()
    var alamoMembers = [String]()
    let memberURL = "http://api-coin.quantox.tech/profiles.json"
    
    @IBOutlet weak var memberTableView: UITableView!
    
    //Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memberTableView.allowsMultipleSelection = true
        memberTableView.delegate = self
        memberTableView.dataSource = self
        setupNavigationBar()
        memberTableView.register(UINib(nibName: "MemberTableViewCell", bundle: nil), forCellReuseIdentifier: "MemberTableViewCell")
        
        getAlamoData(url: memberURL)
        
        
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
        cell.accessoryType = .disclosureIndicator
        
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
        
//         members[indexPath.row].isChecked = !members[indexPath.row].isChecked
        
        
        
        if memberTableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            memberTableView.cellForRow(at: indexPath)?.accessoryType = .disclosureIndicator
        } else {
            memberTableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }

        memberTableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
    //MARK: Alamofire
    
    func getAlamoData(url: String) {
        Alamofire.request(url,method: .get).responseJSON {
            response in
            if response.result.isSuccess {
                
                print("Success!Got the data!")
                let memberJSON: JSON = JSON(response.result.value!)
//                print(memberJSON)
                
                self.updateMembersData(json: memberJSON)
                
            } else {
                print("Error \(String(describing: response.result.error))")
            }
        }
    }
    
    func updateMembersData(json: JSON) {
        
        let arrayUsernames = json["profiles"].arrayValue.map({$0["username"].stringValue})
        alamoMembers.append(contentsOf: arrayUsernames)
        print(alamoMembers)
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

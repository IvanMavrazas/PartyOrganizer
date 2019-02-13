//
//  MembersViewController.swift
//  Party Organizer
//
//  Created by Ivan Mavrazas on 2/11/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit
import Kingfisher

class MembersViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var data: Object? {
        didSet {
            membersTableView.reloadData()
        }
    }

    @IBOutlet weak var membersTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        membersTableView.delegate = self
        membersTableView.dataSource = self

        
        membersTableView.register(UINib(nibName: "MemberTableViewCell", bundle: nil), forCellReuseIdentifier: "MemberTableViewCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "Members"
        fetchData()
    }

    
    //MARK: TableView DataSource Methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberTableViewCell", for: indexPath) as! MemberTableViewCell
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
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let profileVC = storyboard.instantiateViewController(withIdentifier: "ProfileScreen") as! ProfileScreen
        let profiles = data?.profiles[indexPath.row]
        profileVC.profiles = profiles
        self.navigationController?.pushViewController(profileVC, animated: true)
        
    }
    
    
    // MARK: FetchData
    
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

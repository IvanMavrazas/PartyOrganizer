//
//  PartyMemberPreviewScreen.swift
//  Party Organizer
//
//  Created by Ivan Mavrazas on 2/11/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit

class PartyMemberPreviewScreen: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var membersArray = [Member]()
    
    @IBOutlet weak var memberTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        memberTableView.delegate = self
        memberTableView.dataSource = self
        
    }
    
    //MARK - TableView DataSource Methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberTableViewCell", for: indexPath) as! MemberTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return membersArray.count
    }

}

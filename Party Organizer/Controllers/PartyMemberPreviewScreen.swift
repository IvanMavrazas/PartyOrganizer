//
//  PartyMemberPreviewScreen.swift
//  Party Organizer
//
//  Created by Ivan Mavrazas on 2/11/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit
import Kingfisher

class PartyMemberPreviewScreen: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    @IBOutlet weak var memberTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        memberTableView.delegate = self
        memberTableView.dataSource = self
        
        memberTableView.register(UINib(nibName: "MemberTableViewCell", bundle: nil), forCellReuseIdentifier: "MemberTableViewCell")
    }
    
    //MARK - TableView DataSource Methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberTableViewCell", for: indexPath) as! MemberTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

}

//
//  TableViewController.swift
//  Party Organizer
//
//  Created by Ivan Mavrazas on 2/13/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit

class AddMemberToParty: UITableViewController {
    
    var parties = [Party]()
    
    //Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "partyCell", for: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return parties.count
    }
    
}

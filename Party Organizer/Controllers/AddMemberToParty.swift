//
//  TableViewController.swift
//  Party Organizer
//
//  Created by Ivan Mavrazas on 2/13/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit

class AddMemberToParty: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var parties: [Party]? {
        didSet {
            
        }
    }
    
    @IBOutlet var partiesTableView: UITableView!
    //Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        partiesTableView.delegate = self
        partiesTableView.dataSource = self
    }
    
    // MARK: - Table view data source
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "partyCell", for: indexPath)
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
}

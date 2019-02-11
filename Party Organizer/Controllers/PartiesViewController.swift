//
//  ViewController.swift
//  Party Organizer
//
//  Created by Ivan Mavrazas on 2/11/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit

class PartiesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {

    var partiesArray = ["New Year","Xmas"]
    
    @IBOutlet weak var partiesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        partiesTableView.delegate = self
        partiesTableView.dataSource = self
        
        partiesTableView.register(UINib(nibName: "PartyTableViewCell", bundle: nil), forCellReuseIdentifier: "PartyTableViewCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "Parties"
    }
    
    //MARK - TableView DataSource Methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PartyTableViewCell", for: indexPath) as! PartyTableViewCell
        cell.textLabel?.text = partiesArray[indexPath.row]
        print(partiesArray[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partiesArray.count
    }
    
    
}


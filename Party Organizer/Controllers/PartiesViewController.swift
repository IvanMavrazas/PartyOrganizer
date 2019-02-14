//
//  Parties2ViewController.swift
//  Party Organizer
//
//  Created by Ivan Mavrazas on 2/12/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit
import Kingfisher

class PartiesViewController: UITableViewController,PartySavedDelegate {
    
    // CreatePartyVC
    
    var parties = [Party]()
    
    @IBOutlet var partiesTableView: UITableView!

    // Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        partiesTableView.register(UINib(nibName: "PartyTableViewCell", bundle: nil), forCellReuseIdentifier: "PartyTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.topItem?.title = "Parties"
        partiesTableView.reloadData()
    }
    
    //MARK:  TableView DataSource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PartyTableViewCell", for: indexPath) as! PartyTableViewCell
        cell.party = parties[indexPath.row]
        
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parties.count
    }    
    
    //MARK:  Buttons and functions
    
    @IBAction func addPartyPressed(_ sender: UIBarButtonItem) {
        addParty()
    }
    
    func addParty() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let createPartyVC = storyboard.instantiateViewController(withIdentifier: "CreatePartyScreenViewController") as? CreatePartyScreenViewController else {
            fatalError("Couldn't load CreatePartyScreenViewController")
        }
        createPartyVC.delegate = self
        createPartyVC.hidesBottomBarWhenPushed = true
        show(createPartyVC, sender: self)
    }
    
    func userSavedParty(partyName: String, partyDateAndTime: String, partyDescription: String) {
        let oneParty = Party(partyName: partyName, partyDate: partyDateAndTime, partyDescription: partyDescription)
        parties.append(oneParty)
        print(partyName)
    }
}

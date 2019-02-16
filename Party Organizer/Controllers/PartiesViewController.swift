//
//  Parties2ViewController.swift
//  Party Organizer
//
//  Created by Ivan Mavrazas on 2/15/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit

class PartiesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    // CreatePartyVC
    
    var parties = [Party]()
    @IBOutlet weak var emptyScreenView: UIView!
    
    
    @IBOutlet weak var partiesTableView: UITableView!
    
    // Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        partiesTableView.delegate = self
        partiesTableView.dataSource = self
        
        partiesTableView.register(UINib(nibName: "PartyTableViewCell", bundle: nil), forCellReuseIdentifier: "PartyTableViewCell")
        showEmptyScreen()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        partiesTableView.delegate = self
        navigationController?.navigationBar.topItem?.title = "Parties"
        partiesTableView.reloadData()
    }
    
    //MARK:  TableView DataSource Methods
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PartyTableViewCell", for: indexPath) as! PartyTableViewCell
        cell.party = parties[indexPath.row]
        
        return cell
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return parties.count
        
    }
    
    //MARK: Buttons
   
    @IBAction func addPartyPressed(_ sender: UIBarButtonItem) {
        addParty()
    }
    
    @IBAction func createButonPressed(_ sender: UIButton) {
        addParty()
    }
    
    //Functions
    
    func addParty() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let createPartyVC = storyboard.instantiateViewController(withIdentifier: "CreatePartyScreenViewController") as? CreatePartyScreenViewController else {
            fatalError("Couldn't load CreatePartyScreenViewController")
        }
        createPartyVC.delegate = self
        createPartyVC.hidesBottomBarWhenPushed = true
        show(createPartyVC, sender: self)
    }

    func showEmptyScreen() {
        if partiesTableView.numberOfRows(inSection: parties.count) == 0 {
            emptyScreenView.isHidden = false
        }
    }
}

extension PartiesViewController: PartySavedDelegate {
    func userSavedParty(partyName: String, partyDateAndTime: String, partyDescription: String) {
        let oneParty = Party(partyName: partyName, partyDate: partyDateAndTime, partyDescription: partyDescription)
        parties.append(oneParty)
        print(oneParty)
    }

}

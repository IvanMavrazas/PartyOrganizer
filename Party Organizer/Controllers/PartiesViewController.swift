//
//  Parties2ViewController.swift
//  Party Organizer
//
//  Created by Ivan Mavrazas on 2/15/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit

class PartiesViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    var parties = [Party]()
    
    @IBOutlet weak var emptyScreenView: UIView!
    @IBOutlet weak var partiesTableView: UITableView!
    @IBOutlet weak var createPartyButton: UIButton!
    
    // Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        partiesTableView.delegate = self
        partiesTableView.dataSource = self
        partiesTableView.register(UINib(nibName: "PartyTableViewCell", bundle: nil), forCellReuseIdentifier: "PartyTableViewCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        setupRoundButtonCorners()
        super.viewWillAppear(animated)
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
        
        let numberOfParties = parties.count
        if numberOfParties != 0 {
            emptyScreenView.isHidden = true
        }
        return numberOfParties
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, actionPerformed: (Bool) ->()) in
            
            self.deleteParty(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            actionPerformed(true)
        }
        let del = UISwipeActionsConfiguration(actions: [delete])
        del.performsFirstActionWithFullSwipe = false
        if indexPath.section != 0 {
            return del
        }
        return del
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        partiesTableView.deselectRow(at: indexPath, animated: true)
        addParty()
    }
    
    //MARK: Buttons
    
    @IBAction func addPartyPressed(_ sender: UIBarButtonItem) {
        addParty()
    }
    
    @IBAction func createButonPressed(_ sender: UIButton) {
        addParty()
    }
    
    //MARK: Functions
    
    // Add party
    
    func addParty() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let createPartyVC = storyboard.instantiateViewController(withIdentifier: "CreatePartyScreenViewController") as? CreatePartyScreenViewController else {
            fatalError("Couldn't load CreatePartyScreenViewController")
        }
        createPartyVC.delegate = self
        createPartyVC.hidesBottomBarWhenPushed = true
        show(createPartyVC, sender: self)
    }
    
    // Delete party
    
    func deleteParty(index: Int) {
        parties.remove(at: index)
    }

    // Adding corner radius on createPartyButton
    
    func setupRoundButtonCorners() {
        createPartyButton.layer.cornerRadius = 8
        createPartyButton.clipsToBounds = true
    }
    
}

extension PartiesViewController: PartySavedDelegate {
    func userSavedParty(partyName: String, partyDateAndTime: String, partyDescription: String) {
        let oneParty = Party(partyName: partyName, partyDate: partyDateAndTime, partyDescription: partyDescription)
        parties.append(oneParty)
        print(oneParty)
        
    }
    
}

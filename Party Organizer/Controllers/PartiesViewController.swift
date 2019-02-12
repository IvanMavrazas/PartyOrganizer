//
//  Parties2ViewController.swift
//  Party Organizer
//
//  Created by Ivan Mavrazas on 2/12/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit

class PartiesViewController: UITableViewController {

    var partiesArray = ["New Year","Xmas"]
    
    @IBOutlet var partiesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        partiesTableView.register(UINib(nibName: "PartyTableViewCell", bundle: nil), forCellReuseIdentifier: "PartyTableViewCell")

    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.title = "Parties"
        
        
    }

    //MARK - TableView DataSource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PartyTableViewCell", for: indexPath) as! PartyTableViewCell
        cell.textLabel?.text = partiesArray[indexPath.row]
        print(partiesArray[indexPath.row])
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partiesArray.count
    }


    @IBAction func addPartyPressed(_ sender: UIBarButtonItem) {
        addParty()
        
    }
    
    
    func addParty() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let createPartyVC = storyboard.instantiateViewController(withIdentifier: "CreatePartyScreenViewController") as? CreatePartyScreenViewController else {
            fatalError("Couldn't load CreatePartyScreenViewController")
        }
        show(createPartyVC, sender: self)
    }
}

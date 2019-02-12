//
//  CreatePartyScreenViewController.swift
//  Party Organizer
//
//  Created by Ivan Mavrazas on 2/11/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit

class CreatePartyScreenViewController: UIViewController {

    @IBOutlet weak var partyNameLabel: UILabel!
    @IBOutlet weak var partyNameTextField: UITextField!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var startDateAndTimeTextField: UITextField!
    @IBOutlet weak var membersLabel: UILabel!
    @IBOutlet weak var numberOfMembersLabel: UILabel!
    
    @IBOutlet weak var membersTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveNewPartyPressed(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func membersButtonPressed(_ sender: UIButton) {
    }
    
    
}

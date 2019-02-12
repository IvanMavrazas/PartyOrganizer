//
//  CreatePartyScreenViewController.swift
//  Party Organizer
//
//  Created by Ivan Mavrazas on 2/11/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit

class CreatePartyScreenViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var membersArray = ["Mary","Bill"]

    @IBOutlet weak var partyNameLabel: UILabel!
    @IBOutlet weak var partyNameTextField: UITextField!
    
    @IBOutlet weak var startDateAndTimeTextField: UITextField!
    
    @IBOutlet weak var startTimeLabel: UILabel!
    
    @IBOutlet weak var membersLabel: UILabel!
    @IBOutlet weak var numberOfMembersLabel: UILabel!
    
    @IBOutlet weak var membersTableView: UITableView!
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        membersTableView.delegate = self
        membersTableView.dataSource = self
        
        datePicker.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memberCell", for: indexPath)
        cell.textLabel?.text = membersArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return membersArray.count
    }

    @IBAction func saveNewPartyPressed(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func membersButtonPressed(_ sender: UIButton) {
        guard let partyMemberPreviewScreen = storyboard?.instantiateViewController(withIdentifier: "PartyMemberPreviewScreen") as? PartyMemberPreviewScreen else {
            fatalError("Couldn't load PartyMemberPreviewScreen")
        }
        show(partyMemberPreviewScreen, sender: self)
    }
    
    @IBAction func startDateAndTimePressed(_ sender: UIButton) {
        datePicker.isHidden = false
//        setPartyDateAndTime()
        
    }
//    func setPartyDateAndTime() {
//
//    }
    
//    func showDatePicker() {
//
////        datePicker = UIDatePicker()
////        datePicker.datePickerMode = .date
////        datePicker.addTarget(self, action: #selector(UIViewController.dateChanged), for: .valueChanged)
////
////        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIViewController.viewTapped(gestureRecognizer:)))
////
////        view.addGestureRecognizer(tapGesture)
////        startDateAndTimeTextField.inputView = datePicker
////
//
//    }
    
//    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
//    view.endEditing(true)
//    }
//
//    @objc func dateChanged(datePicker: UIDatePicker) {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MM/dd/yyyy/hh/mm"
//        startDateAndTimeTextField.text = dateFormatter.string(from: datePicker.date)
//        view.endEditing(true)
//    }
}


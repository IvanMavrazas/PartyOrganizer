//
//  CreatePartyScreenViewController.swift
//  Party Organizer
//
//  Created by Ivan Mavrazas on 2/11/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit
protocol PartySavedDelegate {
    func userSavedParty(partyName: String,partyDateAndTime: String,partyDescription: String)
}

class CreatePartyScreenViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var delegate: PartySavedDelegate?
    
    @IBOutlet weak var partyNameLabel: UILabel!
    @IBOutlet weak var partyNameTextField: UITextField!
    @IBOutlet weak var startDateAndTimeTextField: UITextField!
    @IBOutlet weak var descriptionPartyTextView: UITextView!
    @IBOutlet weak var membersLabel: UILabel!
    @IBOutlet weak var numberOfMembersLabel: UILabel!
    @IBOutlet weak var membersTableView: UITableView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        membersTableView.delegate = self
        membersTableView.dataSource = self
        
        datePicker.isHidden = true
        descriptionPartyTextView.isHidden = false
        descriptionPartyTextView.text = nil
    }
    
    //MARK: TableView DataSource Methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memberCell", for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
  
    
    //MARK: Buttons
    
    @IBAction func saveNewPartyPressed(_ sender: UIBarButtonItem) {
        if  let party = partyNameTextField.text,let dateAndTime = startDateAndTimeTextField.text, let description = descriptionPartyTextView.text {
            delegate?.userSavedParty(partyName: party, partyDateAndTime: dateAndTime, partyDescription: description)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func membersButtonPressed(_ sender: UIButton) {        
        
        guard let partyMemberPreviewScreen = storyboard?.instantiateViewController(withIdentifier: "PartyMemberPreviewScreen") as? PartyMemberPreviewScreen else {
            fatalError("Couldn't load PartyMemberPreviewScreen")
        }
        partyMemberPreviewScreen.hidesBottomBarWhenPushed = true
        show(partyMemberPreviewScreen, sender: self)
    }
    
    @IBAction func startDateAndTimePressed(_ sender: UIButton) {
        datePicker!.isHidden = datePicker.isHidden == false
        showDatePicker()
    }
    
    //MARK: Date picker
    
    func showDatePicker() {
        
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        startDateAndTimeTextField.inputView = datePicker
        
        if datePicker.isHidden == false {
            descriptionPartyTextView.isHidden = true
        } else {
            descriptionPartyTextView.isHidden = false
        }
        
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
        datePicker.isHidden = datePicker!.isHidden
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy / hh/mm"
        startDateAndTimeTextField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
}


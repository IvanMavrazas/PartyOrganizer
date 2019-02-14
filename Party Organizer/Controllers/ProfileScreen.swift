//
//  ProfileScreen.swift
//  Party Organizer
//
//  Created by Ivan Mavrazas on 2/11/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit

class ProfileScreen: UIViewController {
    
    var profiles: Profiles?
    var data: Object?
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var about: UITextView!
    
    //Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showProfileDetails()
        setupRoundImageCorners()
        setupNavigationBar()
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    //MARK: Buttons
    
    @IBAction func addToPartyPressed(_ sender: Any) {
        
        guard let addMemberToPartyScreen = storyboard?.instantiateViewController(withIdentifier: "AddMemberToParty") as? AddMemberToParty else {
            fatalError("Couldn't load AddMemberToParty")
        }
        show(addMemberToPartyScreen, sender: self)
    }
    
    //MARK: Functions
    
    // Adding corner radius on imageView
    
    func setupRoundImageCorners() {
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.clipsToBounds = true
    }
    
    // Change navigationItem title
    
    func setupNavigationBar() {
        let title = "Profile"
        navigationItem.title = title
    }
    
    //Populate
    
    func populate(withObject object: Profiles?) {
        if let urlLink = object?.photo {
            let url = URL(string: urlLink)
            profileImage.kf.setImage(with: url)
        }
        name.text = object?.username
        gender.text = object?.gender
        email.text = object?.email
        about.text = object?.aboutMe
        
    }
    
    //Show profile details
    
    func showProfileDetails() {
        self.populate(withObject: profiles)
    }
    
}

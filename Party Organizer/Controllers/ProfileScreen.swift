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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showProfileDetails()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.clipsToBounds = true
    }
    
    func setupNavigationBar() {
        let title = name.text
        navigationItem.title = title
    }
    
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
    
    func showProfileDetails() {
        self.populate(withObject: profiles)
    }

    @IBAction func addToPartyPressed(_ sender: Any) {
        
        guard let addMemberToPartyScreen = storyboard?.instantiateViewController(withIdentifier: "AddMemberToParty") as? AddMemberToParty else {
            fatalError("Couldn't load AddMemberToParty")
        }
        show(addMemberToPartyScreen, sender: self)
    }
    

}

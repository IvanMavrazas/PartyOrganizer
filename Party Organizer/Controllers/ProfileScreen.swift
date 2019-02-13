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
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var about: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func addToPartyPressed(_ sender: Any) {
        
    }
    
}

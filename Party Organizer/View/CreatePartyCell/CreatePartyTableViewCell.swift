//
//  CreatePartyTableViewCell.swift
//  Party Organizer
//
//  Created by Ivan Mavrazas on 3/6/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit

class CreatePartyTableViewCell: UITableViewCell {
    
    var member: Member? {
        didSet {
            if let memberName = member?.name {
                memberLabel.text = memberName
            }
        }
    }

    @IBOutlet weak var memberLabel: UILabel!
    
}

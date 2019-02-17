//
//  PartyTableViewCell.swift
//  Party Organizer
//
//  Created by Ivan Mavrazas on 2/11/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit
import Kingfisher

class PartyTableViewCell: UITableViewCell{
    
    var party: Party? {
        didSet {
            if let partyName = party?.name {
                partyNameLabel.text = partyName
            }
            if let partyDateAndTime = party?.date {
                startDateLabel.text = partyDateAndTime
            }
            if let partyDescription = party?.description {
                partyDescriptionLabel.text = partyDescription
            }
        }
    }
    
    @IBOutlet weak var partyNameLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var partyDescriptionLabel: UILabel!
 
    //Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
            
}

//
//  PartyTableViewCell.swift
//  Party Organizer
//
//  Created by Ivan Mavrazas on 2/11/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit
import Kingfisher

class PartyTableViewCell: UITableViewCell,PartySavedDelegate {


    @IBOutlet weak var partyNameLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var partyDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()


    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func userSavedParty(partyName: String, partyDateAndTime: String, partyDescription: String) {
        partyNameLabel.text = partyName
        startDateLabel.text = partyDateAndTime
        partyDescriptionLabel.text = partyDescription
    }
    
}

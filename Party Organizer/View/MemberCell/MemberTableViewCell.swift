//
//  MemberTableViewCell.swift
//  Party Organizer
//
//  Created by Ivan Mavrazas on 2/11/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit
import Kingfisher

class MemberTableViewCell: UITableViewCell {
    
    var profile: Profiles? {
        didSet {
            if let name = profile?.username {
                memberName.text = name
            }
            if let photoURL = profile?.photo {
                if let url = URL(string: photoURL) {
                    memberImage.kf.setImage(with: url)
                }
            }
        }
    }

    @IBOutlet weak var memberImage: UIImageView!
    @IBOutlet weak var memberName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

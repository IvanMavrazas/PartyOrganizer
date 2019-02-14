//
//  MemberTableViewCell.swift
//  Party Organizer
//
//  Created by Ivan Mavrazas on 2/11/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import UIKit
import Kingfisher

protocol MemberTableViewCellDelegate: class {
    func didTapImage(cell:MemberTableViewCell )
}
class MemberTableViewCell: UITableViewCell {
    
   weak var delegate: MemberTableViewCellDelegate?
    
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
        setupRoundImageCorners()
        
        let tapMemberImage = UITapGestureRecognizer(target: self, action: #selector(didTapMemberImage))
        memberImage.isUserInteractionEnabled = true
        memberImage.addGestureRecognizer(tapMemberImage)

    }
  
    //Functions
    
    func setupRoundImageCorners() {
        memberImage.layer.cornerRadius = memberImage.frame.width / 2
        memberImage.clipsToBounds = true
    }
    
    @objc func didTapMemberImage() {
        delegate?.didTapImage(cell: self)
    }
}

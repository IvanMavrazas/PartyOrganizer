//
//  Member.swift
//  Party Organizer
//
//  Created by Ivan Mavrazas on 2/23/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import Foundation

class Member {
    var name: String
    var isChecked: Bool
    
    init (memberName: String, checked: Bool) {
        name = memberName
        isChecked = checked
    }
}

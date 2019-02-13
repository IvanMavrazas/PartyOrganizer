//
//  Party.swift
//  Party Organizer
//
//  Created by Ivan Mavrazas on 2/13/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import Foundation

class Party {
    
    var name: String
    var date: String
    var description: String
    
    init(partyName: String,partyDate: String,partyDescription: String) {
        name = partyName
        date = partyDate
        description = partyDescription
    }
    
}

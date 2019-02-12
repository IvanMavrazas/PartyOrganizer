//
//  MembersModelObject.swift
//  Party Organizer
//
//  Created by Ivan Mavrazas on 2/12/19.
//  Copyright © 2019 Ivan Mavrazas. All rights reserved.
//

import Foundation

struct Object: Codable {
    let profiles: [Profiles]
}

struct Profiles: Codable {
    let id: Int?
    let username: String?
    let cell:String?
    let photo: String?
    let email: String?
    let gender: String?
    let aboutMe: String?
}

//
//  User.swift
//  Shelf
//
//  Created by Raza Qazi on 2018-03-26.
//  Copyright © 2018 Raza Qazi. All rights reserved.
//

import Foundation

class User {
    var first_name: String = ""
    var last_name: String = ""
    var email_address: String = ""
    var user_id: String = ""
    
    init(_ userid:String, _ emailaddress: String, _ firstname:String, _ lastname:String) {
        self.user_id = userid
        self.email_address = emailaddress
        self.first_name = firstname
        self.last_name = lastname
    }
}

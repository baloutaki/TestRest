//
//  User.swift
//  TestRest
//
//  Created by mobapp01 on 22/01/2020.
//  Copyright © 2020 Ehb. All rights reserved.
//

import Foundation

class User{
   
    var userID:Int
    var name:String
    
    internal init(userID: Int, name: String) {
           self.userID = userID
           self.name = name
       }
}

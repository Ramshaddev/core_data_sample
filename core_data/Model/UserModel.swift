//
//  UserModel.swift
//  core_data
//
//  Created by artmac on 11/11/24.
//

import Foundation
class User: Codable{
    let user: [UserModel]?
    
}
class UserModel: Codable{
    let username: String?
    let email: String?
    let password: String?
}

//
//  Dictionary+Extension.swift
//  core_data
//
//  Created by artmac on 11/11/24.
//

import Foundation
extension NSDictionary{
    func convertTOUserModel(userDict: [[String: Any?]]) -> User?{
        do{
            
            let json = try JSONSerialization.data(withJSONObject: userDict)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedUser = try decoder.decode(User.self, from: json)
            return decodedUser
        }catch{
            print("Error")
            return nil
        }
    }
    
}

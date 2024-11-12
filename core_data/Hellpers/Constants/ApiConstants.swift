//
//  ApiConstants.swift
//  core_data
//
//  Created by artmac on 12/11/24.
//

import Foundation

let BaseUrl = "https://netplusqatar.com"

enum Endpoint{
    case home
    
    var value: String{
        switch self{
        case .home:
            return "/api/home.php"
        }
    }
}

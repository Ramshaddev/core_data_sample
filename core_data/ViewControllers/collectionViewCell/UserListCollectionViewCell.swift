//
//  UserListCollectionViewCell.swift
//  core_data
//
//  Created by artmac on 11/11/24.
//

import UIKit

class UserListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(user: UserModel?){
        
        if let email = user?.email{
            emailLabel.text = email
        } 
        if let username = user?.username{
            userNameLabel.text = username
        }
        if let password = user?.password{
            passwordLabel.text = password
        }
        
       
    }

}

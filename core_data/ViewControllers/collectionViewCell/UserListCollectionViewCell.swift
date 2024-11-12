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
        
//        if let email = user?.email, let username = user?.username, let password = user?.password{
        userNameLabel.text = user?.email ?? ""
        emailLabel.text = user?.email ?? ""
        passwordLabel.text = user?.password ?? ""
//        }
        
       
    }

}

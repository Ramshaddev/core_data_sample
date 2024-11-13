//
//  UserListCollectionViewCell.swift
//  core_data
//
//  Created by artmac on 11/11/24.
//

import UIKit

protocol UserCellDelegate: AnyObject{
    func didTapDelete()
}

class UserListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    let coreDataManager = CoreDataManager.shared
    weak var delegate: UserCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configCell(user: UserModel?){
        userNameLabel.text = user?.username ?? ""
        emailLabel.text = user?.email ?? ""
        passwordLabel.text = user?.password ?? ""
    }
    
    @IBAction func editAction(_ sender: Any) {
        coreDataManager.updateCoreData(forUser: userNameLabel.text ?? "")
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        coreDataManager.deleteFromCoreData(withEmail: emailLabel.text ?? "") { [weak self]completed in
            if completed{
                self!.delegate?.didTapDelete()
            }
        }
    }
}

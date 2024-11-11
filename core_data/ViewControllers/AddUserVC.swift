//
//  ViewController.swift
//  core_data
//
//  Created by artmac on 28/10/24.
//

import UIKit

class AddUserVC: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    
    private let coreData = CoreDataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressIndicator.isHidden = true
        progressIndicator.hidesWhenStopped = true
    }

    @IBAction func saveAction(_ sender: Any) {
        if usernameTextField.text != nil && passwordTextField.text != nil && emailTextField.text != nil{
            progressIndicator.isHidden = false
            self.progressIndicator.startAnimating()
            let userDict = ["username": usernameTextField.text ?? "", "email": emailTextField.text ?? "", "password": passwordTextField.text ?? ""]
            coreData.saveToCoreData(userDict: userDict, completion: { status in
                if status{
                    self.progressIndicator.stopAnimating()
                    self.dismiss(animated: true)
                }else{
                    print("Database failed to save")
                }
            })
            
        }
        
    }
    
}


//
//  ListUserVC.swift
//  core_data
//
//  Created by artmac on 11/11/24.
//

import UIKit

class ListUserVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var users: [UserModel]? = nil
    private let coreData = CoreDataManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeCollectionView()
        fetchFromCoreData()
    }
    
    func initializeCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UserListCollectionViewCell.self, forCellWithReuseIdentifier: "UserListCollectionViewCell")
    }
    
    func fetchFromCoreData(){
        guard let result  = coreData.fetchFromCoreData() else { return }
        self.users = convertTOUserModel(userDict: result)
        collectionView.reloadData()
       
    }
    
    func convertTOUserModel(userDict: [[String: Any?]]) -> [UserModel]?{
        do{
            // Remove any `nil` values from the dictionary
               let cleanedUserDict = userDict.map { dict in
                   dict.compactMapValues { $0 }
               }
            
            let json = try JSONSerialization.data(withJSONObject: cleanedUserDict, options: [])
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedUser = try decoder.decode([UserModel].self, from: json)
            return decodedUser
        }catch{
            print("Error")
            return nil
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ListUserVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let usr = self.users{
            return usr.count
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let usr = users{
            if !usr.isEmpty{
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserListCollectionViewCell", for: indexPath) as? UserListCollectionViewCell else {return UICollectionViewCell()}
                cell.configCell(user: usr[indexPath.row])
                return cell
            }
           
        }
       return UICollectionViewCell()
    }
    

    

    
    
}
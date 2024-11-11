//
//  CoreDataManager.swift
//  core_data
//
//  Created by artmac on 11/11/24.
//

import Foundation

import CoreData
import UIKit

class CoreDataManager{
    static let shared = CoreDataManager()
    typealias coompletion = (Bool) -> ()
    
    //MARK: CoreDara Save
    func saveToCoreData(userDict : [String: Any?], completion: @escaping coompletion ){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{ return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let userEntity = NSEntityDescription.entity(forEntityName: "Users", in: managedContext)
        
        let user = NSManagedObject(entity: userEntity!, insertInto: managedContext)
        
        for (key, value) in userDict{
            user.setValue(value, forKey: key)
            
        }
        
        do{
            try managedContext.save()
            print("saved user data\(userDict)")
            completion(true)
        }catch let error as NSError{
            print( error)
            completion(false)
        }
        
        
    }
    
    //MARK: CoreData Fetch
    
    func fetchFromCoreData()->[[String: Any?]]?{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{ return nil }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            var arrdict : [[String: Any?]] = [[:]]
            for data in result as! [NSManagedObject]{
                var dict: [String: Any?] = [:]
                dict["username"] = data.value(forKey: "username") as? String
                dict["email"] = data.value(forKey: "email") as? String
                dict["password"] = data.value(forKey: "password") as? String
                
                arrdict.append(dict)
                
            }
            return arrdict
        }catch let error as NSError {
            print( error)
            return nil
            
        }
    }
    
    //MARK: CoreData Update
    func updateCoreData(){
    
    }
    
    //MARK: CoreData Delete
    func deleteFromCoreData(){
        
    }
}
//
//  TodoListViewController.swift
//  core_data
//
//  Created by artmac on 13/11/24.
//

import UIKit

class TodoListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func getAllItems(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        let context = appDelegate.persistentContainer.viewContext
        
        
        do{
           let items = try context.fetch(TodoList.fetchRequest())
             
        }catch{}
        
    }
    
    func createItem(name: String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        let context = appDelegate.persistentContainer.viewContext
        let newItem = TodoList(context: context)
        newItem.name = name
        newItem.createdAt = Date()
        do{
            try context.save()
        }catch{}
    }
    
    func updateItem(withItem item: TodoList){
        
    }
    
    func deleteItem(withItem item: TodoList){
        
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

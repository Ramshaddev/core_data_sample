//
//  TodoList+CoreDataProperties.swift
//  
//
//  Created by artmac on 13/11/24.
//
//

import Foundation
import CoreData


extension TodoList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoList> {
        return NSFetchRequest<TodoList>(entityName: "TodoList")
    }

    @NSManaged public var name: String?
    @NSManaged public var createdAt: Date?

}

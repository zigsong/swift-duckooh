//
//  Category+CoreData.swift
//  Myday6
//
//  Created by songji on 2020/12/17.
//

import Foundation
import CoreData

public class Category: NSManagedObject, Identifiable {
    @NSManaged public var name: String?
    @NSManaged public var item: String?
    @NSManaged public var createdAt: Date?

    
}

extension Category {
    static func getAllCategories() -> NSFetchRequest<Category> {
        let request: NSFetchRequest<Category> = Category.fetchRequest() as! NSFetchRequest<Category>        
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: false)

        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}

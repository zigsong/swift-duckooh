//
//  Category+CoreDataProperties.swift
//  Myday6
//
//  Created by songji on 2020/12/17.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var data: String?
    @NSManaged public var name: String?

}

extension Category : Identifiable {

}


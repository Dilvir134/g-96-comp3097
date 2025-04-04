//
//  ShoppingItem+CoreDataProperties.swift
//  G-96
//
//  Created by Akorede Osunkoya on 2025-04-03.
//
//

import Foundation
import CoreData


extension ShoppingItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ShoppingItem> {
        return NSFetchRequest<ShoppingItem>(entityName: "ShoppingItem")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var price: Double
    @NSManaged public var quantity: Int16
    @NSManaged public var taxApplicable: Bool
    @NSManaged public var group: ShoppingGroup?

}

extension ShoppingItem : Identifiable {

}

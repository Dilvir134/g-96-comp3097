//
//  ShoppingGroup+CoreDataProperties.swift
//  G-96
//
//  Created by Akorede Osunkoya on 2025-04-03.
//
//

import Foundation
import CoreData


extension ShoppingGroup {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ShoppingGroup> {
        return NSFetchRequest<ShoppingGroup>(entityName: "ShoppingGroup")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var icon: String?
    @NSManaged public var items: NSSet?

}

// MARK: Generated accessors for items
extension ShoppingGroup {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: ShoppingItem)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: ShoppingItem)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}

extension ShoppingGroup : Identifiable {

}

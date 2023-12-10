//
//  Job+CoreDataProperties.swift
//  
//
//  Created by Ben Roberts on 12/10/23.
//
//

import CoreData
import Foundation

extension Job {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Job> {
        return NSFetchRequest<Job>(entityName: "Job")
    }

    @NSManaged public var name: String?
    @NSManaged public var storedPayType: Int16
    @NSManaged public var shifts: NSSet?

}

// MARK: Generated accessors for shifts
extension Job {

    @objc(addShiftsObject:)
    @NSManaged public func addToShifts(_ value: Shift)

    @objc(removeShiftsObject:)
    @NSManaged public func removeFromShifts(_ value: Shift)

    @objc(addShifts:)
    @NSManaged public func addToShifts(_ values: NSSet)

    @objc(removeShifts:)
    @NSManaged public func removeFromShifts(_ values: NSSet)

}

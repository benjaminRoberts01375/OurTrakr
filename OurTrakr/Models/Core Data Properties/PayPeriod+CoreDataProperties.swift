//
//  PayPeriod+CoreDataProperties.swift
//  
//
//  Created by Ben Roberts on 1/6/24.
//
//

import Foundation
import CoreData


extension PayPeriod {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PayPeriod> {
        return NSFetchRequest<PayPeriod>(entityName: "PayPeriod")
    }

    @NSManaged public var totalWorkingHours: Double
    @NSManaged public var start: Date?
    @NSManaged public var durationDays: Int16
    @NSManaged public var shift: NSSet?
    @NSManaged public var job: Job?

}

// MARK: Generated accessors for shift
extension PayPeriod {

    @objc(addShiftObject:)
    @NSManaged public func addToShift(_ value: Shift)

    @objc(removeShiftObject:)
    @NSManaged public func removeFromShift(_ value: Shift)

    @objc(addShift:)
    @NSManaged public func addToShift(_ values: NSSet)

    @objc(removeShift:)
    @NSManaged public func removeFromShift(_ values: NSSet)

}

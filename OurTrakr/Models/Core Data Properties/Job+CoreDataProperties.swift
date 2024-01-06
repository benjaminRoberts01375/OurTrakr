//
//  Job+CoreDataProperties.swift
//  
//
//  Created by Ben Roberts on 1/6/24.
//
//

import Foundation
import CoreData


extension Job {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Job> {
        return NSFetchRequest<Job>(entityName: "Job")
    }

    @NSManaged public var name: String?
    @NSManaged public var payPerPayType: Double
    @NSManaged public var storedPayType: Int16
    @NSManaged public var totalWorkingHours: Double
    @NSManaged public var typicalShiftDurationSeconds: Int32
    @NSManaged public var payPeriods: NSSet?

}

// MARK: Generated accessors for payPeriods
extension Job {

    @objc(addPayPeriodsObject:)
    @NSManaged public func addToPayPeriods(_ value: PayPeriod)

    @objc(removePayPeriodsObject:)
    @NSManaged public func removeFromPayPeriods(_ value: PayPeriod)

    @objc(addPayPeriods:)
    @NSManaged public func addToPayPeriods(_ values: NSSet)

    @objc(removePayPeriods:)
    @NSManaged public func removeFromPayPeriods(_ values: NSSet)

}

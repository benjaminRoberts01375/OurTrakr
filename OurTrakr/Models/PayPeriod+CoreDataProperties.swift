//
//  PayPeriod+CoreDataProperties.swift
//  
//
//  Created by Ben Roberts on 1/6/24.
//
//

import CoreData
import Foundation

extension PayPeriod {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PayPeriod> {
        return NSFetchRequest<PayPeriod>(entityName: "PayPeriod")
    }

    @NSManaged public var totalWorkingHours: Double
    @NSManaged public var start: Date?
    @NSManaged public var durationDays: Int16
    @NSManaged public var shift: Shift?

}

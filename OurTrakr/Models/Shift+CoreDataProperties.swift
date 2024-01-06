//
//  Shift+CoreDataProperties.swift
//  
//
//  Created by Ben Roberts on 1/6/24.
//
//

import CoreData
import Foundation

extension Shift {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Shift> {
        return NSFetchRequest<Shift>(entityName: "Shift")
    }

    @NSManaged public var end: Date?
    @NSManaged public var start: Date?
    @NSManaged public var payPeriod: PayPeriod?

}

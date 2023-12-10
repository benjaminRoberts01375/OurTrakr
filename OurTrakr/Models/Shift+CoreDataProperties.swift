//
//  Shift+CoreDataProperties.swift
//  
//
//  Created by Ben Roberts on 12/10/23.
//
//

import Foundation
import CoreData


extension Shift {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Shift> {
        return NSFetchRequest<Shift>(entityName: "Shift")
    }

    @NSManaged public var start: Date?
    @NSManaged public var end: Date?
    @NSManaged public var job: Job?

}

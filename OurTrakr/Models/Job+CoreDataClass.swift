//
//  Job+CoreDataClass.swift
//  
//
//  Created by Ben Roberts on 12/10/23.
//
//

import CoreData
import Foundation

@objc(Job)
public class Job: NSManagedObject, Identifiable {
    static let defaultName = "New Job"
    
    var unwrappedName: String {
        get { self.name ?? Job.defaultName }
        set(newValue) { self.name = newValue }
    }
    
    var unwrappedShifts: Set<Shift> {
        self.shifts as? Set<Shift> ?? []
    }
    
    var payType: PayType {
        get { PayType(rawValue: Int(self.storedPayType)) ?? .hourly }
        set(newValue) {
            if newValue.rawValue <= 3 {
                self.storedPayType = Int16(newValue.rawValue)
            }
        }
    }
    
    enum PayType: Int {
        case salary = 1
        case hourly = 2
        case shift = 3
    }
}

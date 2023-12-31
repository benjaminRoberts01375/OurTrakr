//
//  PayPeriod+CoreDataClass.swift
//  
//
//  Created by Ben Roberts on 1/6/24.
//
//

import Foundation
import CoreData

@objc(PayPeriod)
public class PayPeriod: NSManagedObject, Identifiable {
    var unwrappedShifts: Set<Shift> { self.shift as? Set<Shift> ?? [] }
}

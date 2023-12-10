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
}

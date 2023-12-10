//
//  DataController.swift
//  OurTrakr
//
//  Created by Ben Roberts on 12/10/23.
//

import CoreData
import SwiftUI

/// Generates and manages a Managed Object Context
class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "OurTrakr")
    
    init() {
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Core Data Error: \(error.localizedDescription)")
            }
        }
    }
}

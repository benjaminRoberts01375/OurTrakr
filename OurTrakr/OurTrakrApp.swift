//
//  OurTrakrApp.swift
//  OurTrakr
//
//  Created by Ben Roberts on 12/9/23.
//

import SwiftUI

@main
struct OurTrakrApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}

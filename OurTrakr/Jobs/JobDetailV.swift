//
//  JobSelection.swift
//  OurTrakr
//
//  Created by Ben Roberts on 12/10/23.
//

import SwiftUI

struct JobDetailV: View {
    @ObservedObject var job: FetchedResults<Job>.Element
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        List(Array(job.unwrappedShifts)) { shift in
            Text("\(shift.start ?? Date())")
        }
        .navigationTitle("\(job.unwrappedName) Shifts")
        .toolbar {
            Button("Add", systemImage: "plus") {
                let shift = Shift(context: moc)
                shift.job = job
                shift.start = Date() // Temp
                shift.end = Date() // Temp
            }
        }
    }
}

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
    @State var addingJob = false
    
    var body: some View {
        EmptyView()
//        List(Array(job.unwrappedShifts)) { shift in
//            Text(shift.formattedDuration)
//            Text(shift.start?.dateSlash ?? "")
//        }
//        .navigationTitle("\(job.unwrappedName) Pay Periods")
//        .toolbar {
//            Button("Add", systemImage: "plus") { addingJob = true }
//        }
//        .sheet(isPresented: $addingJob) { AddShiftV(job: job) }
    }
}

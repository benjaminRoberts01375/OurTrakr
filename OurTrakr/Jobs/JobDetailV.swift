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
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
        List(Array(job.unwrappedPayPeriods)) { payPeriod in
            if let startDate = payPeriod.start {
                NavigationLink(value: payPeriod) {
                    PayPeriodListItemV(payPeriod: payPeriod)
                }
            }
        }
        .navigationTitle("\(job.unwrappedName) Pay Periods")
        .navigationDestination(for: PayPeriod.self) { PayPeriodDetailV(payPeriod: $0, navigationPath: $navigationPath) }
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

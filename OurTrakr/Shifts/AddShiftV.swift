//
//  AddShiftV.swift
//  OurTrakr
//
//  Created by Ben Roberts on 12/10/23.
//

import SwiftUI

struct AddShiftV: View {
    @ObservedObject var job: FetchedResults<Job>.Element
    @Environment(\.managedObjectContext) private var moc
    @Environment(\.dismiss) private var dismiss
    @State var startTime: Date = Date.now.addingTimeInterval(-14400)
    @State var endTime: Date = Date()
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Shift Times") {
                    DatePicker("Start time", selection: $startTime)
                    DatePicker("End time", selection: $endTime)
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        let newShift = Shift(context: moc)
                        newShift.job = job
                        dismiss()
                    }
                }
            }
        }
    }
}

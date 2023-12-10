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
    @State private var startTime: Date = Date.now.addingTimeInterval(-14400)
    @State private var endTime: Date = Date()
    @State private var allowedShift: Bool = true
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Shift Times") {
                    DatePicker("Started", selection: $startTime)
                    DatePicker("Ended", selection: $endTime)
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
                        newShift.start = startTime
                        newShift.end = endTime
                        dismiss()
                    }
                    .disabled(!allowedShift)
                }
            }
        }
        .onChange(of: startTime) { allowedShift = $0 < endTime }
    }
}

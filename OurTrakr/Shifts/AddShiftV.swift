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
    
    init(job: FetchedResults<Job>.Element) {
        self._job = ObservedObject(initialValue: job)
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date)
        let roundedDate = calendar.date(from: components) ?? date
        
        self._startTime = State(initialValue: roundedDate.addingTimeInterval(-14400))
        self._endTime = State(initialValue: endTime)
    }
    
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
//                        newShift.job = job
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

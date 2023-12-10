//
//  AddJobV.swift
//  OurTrakr
//
//  Created by Ben Roberts on 12/10/23.
//

import SwiftUI

struct AddJobV: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var moc
    @State private var jobName: String = ""
    @State private var validJob: Bool = false
    @State private var payType: Job.PayType = .hourly
    @State private var showWageField: Bool = true
    @State private var payPerType: String = ""
    private let currencySymbol = Locale.current.currencySymbol ?? "$"
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: EmptyView()) {
                    TextField("Name", text: $jobName)
                }
                Section(header: Text("Pay")) {
                    Picker("Pay type", selection: $payType) {
                        Text("Hourly").tag(Job.PayType.hourly)
                        Text("Salary").tag(Job.PayType.salary)
                        Text("Per Shift").tag(Job.PayType.shift)
                        Text("Unpaid").tag(Job.PayType.unpaid)
                    }
                    .pickerStyle(.menu)
                    if showWageField {
                        HStack(spacing: 0) {
                            Text(currencySymbol)
                            switch payType {
                            case .salary:
                                TextField(currencySymbol, text: $payPerType, prompt: Text(" Yearly Rate"))
                                Text(" / yr")
                            case .hourly:
                                TextField(currencySymbol, text: $payPerType, prompt: Text(" Hourly Rate"))
                                Text(" / hr")
                            case .shift:
                                TextField(currencySymbol, text: $payPerType, prompt: Text(" Shift Rate"))
                                Text(" / shift")
                            case .unpaid:
                                EmptyView()
                            }
                        }
                        .keyboardType(.decimalPad)
                    }
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
                        let newJob = Job(context: moc)
                        newJob.name = jobName
                        newJob.payType = payType
                        newJob.payPerPayType = Double(payPerType) ?? 0
                        dismiss()
                    }
                    .disabled(!validJob)
                }
            }
        }
        .onChange(of: payType) { _ in
            switch payType {
            case .salary, .hourly, .shift:
                showWageField = true
            case .unpaid:
                showWageField = false
            }
        }
        .animation(.easeInOut, value: showWageField)
        .onChange(of: jobName) { _ in
            validJob = checkValidJob()
        }
    }
    
    func checkValidJob() -> Bool {
        if jobName.isEmpty { return false }
        if showWageField && !payPerType.isNumber { return false }
        return true
    }
}

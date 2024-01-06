//
//  PayPeriodDetailV.swift
//  OurTrakr
//
//  Created by Ben Roberts on 1/6/24.
//

import SwiftUI

struct PayPeriodDetailV: View {
    @ObservedObject var payPeriod: FetchedResults<PayPeriod>.Element
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
        List(Array(payPeriod.unwrappedShifts)) { shift in
            if shift.start != nil {
                NavigationLink(value: shift) { ShiftListItemV(shift: shift) }
            }
        }
        .navigationTitle(payPeriod.job?.unwrappedName ?? "Shifts")
        .navigationDestination(for: Job.self) { JobDetailV(job: $0, navigationPath: $navigationPath) }
    }
}

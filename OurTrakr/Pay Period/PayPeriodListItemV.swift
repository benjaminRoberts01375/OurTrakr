//
//  PayPeriodListItemV.swift
//  OurTrakr
//
//  Created by Ben Roberts on 1/6/24.
//

import SwiftUI

struct PayPeriodListItemV: View {
    @ObservedObject var payPeriod: FetchedResults<PayPeriod>.Element
    
    var body: some View {
        HStack {
            Text(payPeriod.start?.description ?? "Pay Period")
            Spacer()
            Text("Total $ earned")
        }
    }
}

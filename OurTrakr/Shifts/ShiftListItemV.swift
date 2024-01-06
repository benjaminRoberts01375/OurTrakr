//
//  ShiftListItemV.swift
//  OurTrakr
//
//  Created by Ben Roberts on 1/6/24.
//

import SwiftUI

struct ShiftListItemV: View {
    @ObservedObject var shift: FetchedResults<Shift>.Element
    
    var body: some View {
        HStack {
            Text(shift.start?.description ?? "Shift")
            Spacer()
            Text("Total gained")
        }
    }
}

//
//  JobListItemV.swift
//  OurTrakr
//
//  Created by Ben Roberts on 12/10/23.
//

import SwiftUI

struct JobListItemV: View {
    @ObservedObject var job: FetchedResults<Job>.Element
    
    var body: some View {
        HStack {
            Text(job.name ?? "Unknown job")
            Spacer()
            Text("Hours")
                .foregroundStyle(.secondary)
        }
    }
}

//
//  JobSelection.swift
//  OurTrakr
//
//  Created by Ben Roberts on 12/10/23.
//

import SwiftUI

struct JobDetailV: View {
    @ObservedObject var job: FetchedResults<Job>.Element
    
    var body: some View {
        Text(job.name ?? "No name")
    }
}

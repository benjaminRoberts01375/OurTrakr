//
//  ContentView.swift
//  OurTrakr
//
//  Created by Ben Roberts on 12/9/23.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: []) var jobs: FetchedResults<Job>
    @Environment(\.managedObjectContext) var moc
    @State var navigationPath = NavigationPath()
    static let title = "Jobs"
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            List {
                ForEach(jobs) { job in
                    NavigationLink(value: job) {
                        JobListItemV(job: job)
                    }
                }
            }
            .navigationTitle(ContentView.title)
            .navigationDestination(for: Job.self) { JobDetailV(job: $0) }
            .toolbar {
                Button("Add", systemImage: "plus") {
                    let job = Job(context: moc)
                    job.name = "New Job"
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

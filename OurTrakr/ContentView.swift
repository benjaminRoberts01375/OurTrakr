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
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            List {
                ForEach(jobs) { job in
                    NavigationLink(value: job) {
                        JobListItemV(job: job)
                    }
                }
                .navigationDestination(for: Job.self) { job in
                    Text(job.name ?? "No name")
                }
            }
            .toolbar {
                Button("Add", systemImage: "plus") {
                    let job = Job(context: moc)
                    job.name = "New Job"
                }
            }
            .navigationTitle("Jobs")
        }
    }
}

#Preview {
    ContentView()
}

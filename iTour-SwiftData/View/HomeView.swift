//
//  HomeView.swift
//  iTour-SwiftData
//
//  Created by ömer şanlı on 28.01.2024.
//

import SwiftData
import SwiftUI

struct HomeView: View {
    @Environment(\.modelContext) var modelContext
    // Query macro annotation, read out all Destinations

    @State private var path = [Destination]()
    @State private var sortOrder = SortDescriptor(\Destination.name)
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack(path: $path){
            DestinationListingView(sort: sortOrder, searchString: searchText)
            .navigationTitle("iTour")
            .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
            .searchable(text: $searchText)
            .toolbar{
                Button("Add Destination", systemImage: "plus", action: addDestination)
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Name")
                            .tag(SortDescriptor(\Destination.name))

                        Text("Priority")
                            .tag(SortDescriptor(\Destination.priority, order: .reverse))

                        Text("Date")
                            .tag(SortDescriptor(\Destination.date))
                    }
                    .pickerStyle(.inline)
                }
            }
        }
    }
    func addSamples(){
        let rome = Destination(name: "Rome")
        let florence = Destination(name: "Rome")
        let naples = Destination(name: "Naples")
        modelContext.insert(rome)
        modelContext.insert(florence)
        modelContext.insert(naples)
    }
    
    func addDestination(){
        let destination = Destination()
        modelContext.insert(destination)
        path = [destination]
    }
    

}

#Preview {
    HomeView()
}

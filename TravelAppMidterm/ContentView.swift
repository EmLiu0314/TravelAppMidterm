//
//  ContentView.swift
//  TravelAppMidterm
//
//  Created by Liu, Emily on 3/22/24
//

import SwiftUI


struct Trip: Identifiable {
    let id = UUID()
    let destination: String
    let duration: String
    let imageName: String
    var notes: String
}

struct ContentView: View {
    @State private var trips: [Trip] // Use @State for trips
    @State private var showingNewTripView: Bool = false

    init() {
        // Initialize trips with the list of trips
        self._trips = State(initialValue: [
            Trip(destination: "Paris", duration: "March 12 - 18", imageName: "paris", notes: ""),
            Trip(destination: "Seattle", duration: "May 16 - 29", imageName: "seattle", notes: ""),
            Trip(destination: "Greece", duration: "August 5-12", imageName: "greece", notes: ""),
            Trip(destination: "Rome", duration: "August 13-20", imageName: "rome", notes: "")
        ])
        
        // Load notes from UserDefaults and update the trips with notes
        for index in trips.indices {
            let notes = UserDefaults.standard.string(forKey: "\(trips[index].id)-notes") ?? ""
            trips[index].notes = notes
        }
    }

    var body: some View {
        NavigationView {
            List(trips) { trip in
                NavigationLink(destination: TripDetailView(trip: trip)) {
                    TripRow(trip: trip)
                }
            }
            .navigationTitle("Trips")
            .navigationBarItems(trailing: Button(action: {
                showingNewTripView = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingNewTripView) {
                NewTrip()
            }
        }
    }
}

struct TripDetailView: View {
    let trip: Trip
    
    var body: some View {
        VStack {
            Image(trip.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            Text(trip.destination)
                .font(.title)
                .padding(.top)
            Text("Duration: \(trip.duration)")
                .font(.subheadline)
                .foregroundColor(.gray)
            NavigationLink(destination: EventView(trip: trip)) {
                Text("Add Events and Notes")
            }
            .padding()
            Spacer()
        }
        .navigationTitle(trip.destination)
    }
}

struct TripRow: View {
    let trip: Trip
    
    var body: some View {
        HStack {
            Image(trip.imageName)
                .resizable()
                .frame(width: 50, height: 70)
            VStack(alignment: .leading) {
                Text(trip.destination)
                    .font(.headline)
                Text("Duration: \(trip.duration)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

// NewTripView definition remains unchanged

// EventView definition is not provided

#Preview {
    ContentView()
}

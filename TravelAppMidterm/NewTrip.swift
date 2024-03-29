//
//  NewTrip.swift
//  TravelAppMidterm
//
//  Created by Liu, Emily on 3/29/24.
//
import SwiftUI

struct NewTrip: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var destination: String = ""
    @State private var duration: String = ""
    @State private var imageName: String = "" // You may want to replace this with a picker or allow the user to select an image
    
    var body: some View {
        VStack {
            TextField("Destination", text: $destination)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Duration", text: $duration)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Save", action: saveTrip)
                .padding()
        }
        .navigationBarTitle("New Trip")
        .navigationBarItems(trailing: Button("Cancel", action: dismiss))
    }
    
    func saveTrip() {
        // Save the new trip to your data model or database
        // For demo purposes, we'll just print the trip details
        print("New Trip: Destination - \(destination), Duration - \(duration)")
        
        // Dismiss the NewTripView
        dismiss()
    }
    
    func dismiss() {
        // Dismiss the NewTripView
        presentationMode.wrappedValue.dismiss()
    }
}


#Preview {
    NewTrip()
}

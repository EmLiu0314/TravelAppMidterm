//
//  EventView.swift
//  TravelAppMidterm
//
//  Created by Liu, Emily on 3/29/24.
//

import SwiftUI

struct EventView: View {
    let trip: Trip
    @State private var notes: String = ""
    
    var body: some View {
        VStack {
            Text("Add Events and Notes")
                .font(.title)
                .padding()
            
            // Add your UI components for adding events and writing notes here
            
            TextField("Enter events", text: .constant(""))
                .padding()
            
            TextField("Write notes", text: $notes)
                .padding()
            
            Button("Save", action: {
                // Save notes here
            })
            .padding()
        }
        .navigationBarTitle("Add Events")
        
    }
}



//#Preview {
//    EventView()
//}

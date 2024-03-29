//
//  Login.swift
//  TravelAppMidterm
//
//  Created by Liu, Emily on 3/29/24.
//

import SwiftUI


struct Login: View {
    @State private var isStartPressed: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to BeeVoyage")
                    .font(.title)
                    .padding()
                
                Button("Start", action: {
                    isStartPressed = true
                })
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)
                .padding()
                
                NavigationLink(destination: ContentView(), isActive: $isStartPressed) {
                    EmptyView()
                }
                .hidden()
            }
            .navigationTitle("Start")
        }
    }
}

#Preview {
    Login()
}

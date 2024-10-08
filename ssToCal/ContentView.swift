//
//  ContentView.swift
//  ssToCal
//
//  Created by Koosha Paridehpour on 10/7/24.
//

import SwiftUI
import GoogleSignIn_GoogleSignIn
import GoogleSignIn_GoogleSignInSwift
struct ContentView: View {
    @State var eventName: String = ""
    @State var eventDescr: String = ""
    @State var eventLoco: String = ""
    @State var selectedDate: Date = Date()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Welcome To ssToCal")
            Text("Please Create Your New Event.")
        }
        VStack{
            Form {
                TextField("Enter Event Name",text: $eventName)
                TextField("Enter Event Description",text: $eventDescr)
                TextField("Enter Event Location",text: $eventLoco)
                DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle()) // You can use different styles here
                    .padding()
                
                Text("Selected Date: \(selectedDate.formatted(date: .abbreviated, time: .omitted))")
                GoogleSignInButton(action: handleSignInButton)
            }
            GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
                if let error = error {
                    print("Google Sign-In failed: \(error.localizedDescription)")
                    return
                }
                
                // Successfully signed in
                guard let user = signInResult?.user else { return }
                print("User signed in: \(user.profile?.name ?? "Unknown")")
            }
        }
        .onOpenURL { url in
                  GIDSignIn.sharedInstance.handle(url)
        .padding()
    }
    
}

#Preview {
    ContentView()
}


//
//  ContentView.swift
//  ssToCal
//
//  Created by Koosha Paridehpour on 10/7/24.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
func handleSignInButton() {
 
  print("Success")
}
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
        }
    }
    
}

#Preview {
    ContentView()
}


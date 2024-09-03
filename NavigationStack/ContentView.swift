//
//  ContentView.swift
//  NavigationStack
//
//  Created by administrator on 03/09/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var age: String = ""
    
    var body: some View {
        
        NavigationStack {
            VStack {
              
                VStack(alignment: .leading) {
                    Text("Entr Your Name")
                    TextField("Ron Erex", text: $name)
                }
                VStack(alignment: .leading) {
                    Text("Entr Your Age")
                    TextField("16", text: $age)
                        .keyboardType(.numberPad)
                }
                
                Spacer()
                
                NavigationLink(destination: {
                    DrivingView(name: name, age: age, DirvingAge: 18)
                }, label: {
                    Text("Okay")
                        .font(.title)
                        .overlay(
                            Capsule()
                                .stroke()
                        )
                        .padding()
                })
                
                NavigationLink(destination: {
                    ZStack {
                        Color.orange.ignoresSafeArea()
                        Text("New View")
                    }
                }, label: {
                    Text("Go to orange View")
                        .font(.title)
                        .overlay(
                            Capsule()
                                .stroke()
                                .fill(Color.orange)
                        )
                        .padding()
                })
                
            }
            .padding()
            .navigationTitle("Example")
        }
    }
}

struct DrivingView: View {
    let name: String
    let age: String
    let DirvingAge: Int
    
    var numericalAge: Int {
        Int(age) ?? -1
    }
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.7).ignoresSafeArea()
            if numericalAge >= DirvingAge {
                Text("\(name.capitalized) you can drive")
            }else if numericalAge <= 0 {
                Text("Invalid age")
            }
            else {
                VStack {
                    Text("Sorry \(name.capitalized)")
                    Text("You can't drive")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

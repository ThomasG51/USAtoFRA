//
//  ContentView.swift
//  USAtoFRA
//
//  Created by Thomas George on 08/05/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var number: String = ""
    @State private var unitSelected: Int = 0
        
    let frValues = ["Km", "Celsius", "euro"]
    let usValues = ["🚦 Miles", "🌡 Fahrenheit", "💵 dollar"]
    
    var result: Double {
        let input: Double = Double(number) ?? 0.0
        
        if unitSelected == 1 {
            return (input - 32) * 5/9
        } else if unitSelected == 2 {
            return input * 0.82
        } else {
            return input * 1.6
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter your value", text: $number)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Choose your unit")) {
                    Picker("", selection: $unitSelected) {
                        ForEach(0 ..< usValues.count) {
                            Text("\(usValues[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Your conversion")) {
                    Picker("", selection: $unitSelected) {
                        ForEach(0 ..< frValues.count) {
                            Text("\(frValues[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Result")) {
                    Text("\(result, specifier: "%.2F")")
                }
            }
            .navigationBarTitle(Text("USA to FRA"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

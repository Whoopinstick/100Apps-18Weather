//
//  LocationView.swift
//  Weather
//
//  Created by Kevin Paul on 12/27/20.
//

import SwiftUI

struct LocationView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var latitude: String = ""
    @State private var longitude: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Coordinates:")) {
                    TextField("Latitude", text: $latitude)
                        .keyboardType(.decimalPad)
                    TextField("Longitude", text: $longitude)
                        .keyboardType(.decimalPad)
                }
                
                Button(action: {
                    saveLocation()
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save Coordinates")
                }
            }
            .navigationTitle("Location")
            .navigationBarItems(trailing: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle")
                    .renderingMode(.original)
                    .scaleEffect(1.25)
            })
        }
    }
    func saveLocation() {
        print("location saved")
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}

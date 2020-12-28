//
//  LocationView.swift
//  Weather
//
//  Created by Kevin Paul on 12/27/20.
//

import SwiftUI

struct LocationView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = LocationViewViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Coordinates:")) {
                    TextField("Latitude", text: $viewModel.latitude)
                        .keyboardType(.numbersAndPunctuation)
                    TextField("Longitude", text: $viewModel.longitude)
                        .keyboardType(.numbersAndPunctuation)
                }
                
                Button(action: {
                    viewModel.saveLocation()
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save Coordinates")
                }
                .disabled(viewModel.isSaveDisabled)
                
                
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
    
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}

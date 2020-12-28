//
//  LocationViewViewModel.swift
//  Weather
//
//  Created by Kevin Paul on 12/28/20.
//

import SwiftUI

final class LocationViewViewModel: ObservableObject {
    @Published var latitude: String = ""
    @Published var longitude: String = ""
    var isSaveDisabled: Bool {
        if latitude.isEmpty || longitude.isEmpty {
            return true
        }
        guard let latDouble = Double(latitude) else { return false }
        guard let lonDouble = Double(longitude) else { return false }
        if latDouble >= -90 && latDouble <= 90 && lonDouble >= -180 && lonDouble <= 180 {
            return false
        } else {
            return true
        }
    }
    
    func saveLocation() {
        print("location saved")
    }
    
}

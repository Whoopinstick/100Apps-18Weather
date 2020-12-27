//
//  MainViewViewModel.swift
//  Weather
//
//  Created by Kevin Paul on 12/21/20.
//

import SwiftUI

final class MainViewViewModel: ObservableObject {
    @Published var weather = Weather()
    @Published var isLoading = false
    
    func getWeather() {
        isLoading = true
        NetworkManager.shared.getWeather { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let weather):
                    self.weather = weather
                    
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        print("invalid data")
                        
                    case .invalidURL:
                        print("invalid url")
                        
                    case .invalidResponse:
                        print("invalid response")
                        
                    case .unableToComplete:
                        print("unable to complete")
                    }
                }
            }
        }
    }
}

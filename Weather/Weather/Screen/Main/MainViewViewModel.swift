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
    @Published var alertItem: AlertItem?
    
    func getWeather() {
        isLoading = true
        NetworkManager.shared.getWeather { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let weather):
                    self.weather = weather
                    print("retrieved weather")
                    
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}

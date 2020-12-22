//
//  ContentView.swift
//  Weather
//
//  Created by Kevin Paul on 12/12/20.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MainViewViewModel()
    var body: some View {
        ZStack {
            VStack {
                Text("\(viewModel.weather.lat)")
                Text("\(viewModel.weather.lon)")
                Text(viewModel.weather.timezone)
                Text("\(viewModel.weather.current.temp, specifier: "%.0f")")
                
            }
            
            if viewModel.isLoading {
                WWProgressView()
            }
        }
        .onAppear {
            viewModel.getWeather()
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

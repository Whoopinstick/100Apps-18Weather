//
//  ContentView.swift
//  Weather
//
//  Created by Kevin Paul on 12/12/20.
//

import SwiftUI

struct MainView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var viewModel = MainViewViewModel()
    @State private var isDisplayingLocationView = false
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [colorScheme == .dark ? Color.gray : Color.white, Color.gray, colorScheme == .dark ? Color.black : Color.blue]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("\(viewModel.weather.lat)")
                    Text("\(viewModel.weather.lon)")
                    Text(viewModel.weather.timezone)
                    Text("\(viewModel.weather.current.temp, specifier: "%.0f")")
                    
                    Text("Daily - ")
                    ForEach(viewModel.weather.daily) { daily in
                        HStack {
                            Text("min: \(daily.temp.min, specifier: "%.0f")")
                            Text("max: \(daily.temp.max, specifier: "%.0f")")
                            Text("weather: \(daily.weatherID)")
                        }
                    }
                }
                
//                if viewModel.isLoading {
//                    WWProgressView()
//                        .offset(x: 0, y: -50)
//                }
                
            }
            .onAppear {
                viewModel.getWeather()
            }
            
            .navigationTitle("Weather")
            .navigationBarItems(leading:
                                    Button(action: {
                                        isDisplayingLocationView = true
                                    }) {
                                        Image(systemName: "gearshape")
                                            .foregroundColor(.primary)
                                            .scaleEffect(1.25)
                                    },
                                trailing:
                                    Button(action: {
                                        print("refreshing")
                                        viewModel.getWeather()
                                    }) {
                                        Image(systemName: "arrow.clockwise")
                                            .foregroundColor(.primary)
                                            .scaleEffect(1.25)
                                    }
            )
            
        }
        .sheet(isPresented: $isDisplayingLocationView, content: {
            LocationView()
        })
        
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
            MainView()
                .preferredColorScheme(.dark)
        }
            
        
        
    }
}

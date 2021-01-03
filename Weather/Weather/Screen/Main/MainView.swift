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
        ZStack {
            LinearGradient(gradient: Gradient(colors: [colorScheme == .dark ? Color.gray : Color.white, Color.gray, colorScheme == .dark ? Color.black : Color.blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Button(action: {
                        isDisplayingLocationView = true
                    }) {
                        Image(systemName: "gearshape")
                            .foregroundColor(.primary)
                            .clipShape(Circle())
                            .scaleEffect(1.25)
                    }
                    
                    Spacer()
                    
                    Text("\(viewModel.weather.americanCity)")
                        .lineLimit(1)
                        .font(.system(size: 32.0, weight: .medium, design: .default))
                    
                    Spacer()
                    
                    Button(action: {
                        print("refreshing")
                        viewModel.getWeather()
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(.primary)
                            .clipShape(Circle())
                            .scaleEffect(1.25)
                    }
                    
                }
                .padding()
                
                VStack(spacing: 10) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180, height: 180)
                    
                    Text("\(viewModel.weather.current.temp, specifier: "%.0f")°")
                        .font(.system(size: 70, weight: .medium, design: .default))
                    
                    Spacer().frame(height: 20)
                }
                .padding()
                
                VStack {
                    ScrollView {
                        
                        ForEach(viewModel.weather.dailyForecast) { daily in
                            
                            HStack {
                                Text("Tuesday")
                                    .font(.system(size: 28, weight: .medium, design: .default))
                                
                                Spacer()
                                
                                Image(systemName: daily.weatherID)
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                
                                Spacer()
                                
                                Text("\(daily.temp.max, specifier: "%.0f")°")
                                    .font(.system(size: 28, weight: .medium, design: .default))
                                
                                Spacer()
                                
                                Text("\(daily.temp.min, specifier: "%.0f")°")
                                    .font(.system(size: 28, weight: .medium, design: .default))
                                   
                            }
                            .padding(10)
                        }
                        .padding()
                    }
                }
                
                Spacer()
                
            }
            if viewModel.isLoading {
                WWProgressView()
            }
        }
        
        .onAppear {
            viewModel.getWeather()
        }
        
        .sheet(isPresented: $isDisplayingLocationView, content: {
            LocationView(weather: viewModel)
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
                .preferredColorScheme(.dark)
            MainView()
        }
    }
}

//
//  WeatherView.swift
//  Weather
//
//  Created by Kevin Paul on 12/30/20.
//

import SwiftUI

struct WeatherView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [colorScheme == .dark ? Color.gray : Color.white, Color.gray, colorScheme == .dark ? Color.black : Color.blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Button(action: {
                        //isDisplayingLocationView = true
                    }) {
                        Image(systemName: "gearshape")
                            .foregroundColor(.primary)
                            .clipShape(Circle())
                            .scaleEffect(1.25)
                    }
                    
                    Spacer()
                    
                    Text("Detroit, MI")
                        .font(.system(size: 32.0, weight: .medium, design: .default))
                    
                    Spacer()
                    
                    Button(action: {
                        print("refreshing")
                        //viewModel.getWeather()
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
                    
                    Text(" 70 ℉")
                        .font(.system(size: 70, weight: .medium, design: .default))
                    
                    Spacer().frame(height: 20)
                }
                .padding()
                
                VStack {
                    ScrollView {
                        
                        ForEach(0..<8) { item in
                            HStack {
                                Text("Tuesday")
                                    .font(.system(size: 28, weight: .medium, design: .default))
                                
                                Spacer()
                                
                                Image(systemName: "cloud.sun.fill")
                                    .renderingMode(.original)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                
                                Spacer()
                                
                                Text("70°")
                                    .font(.system(size: 28, weight: .medium, design: .default))
                                
                                Spacer()
                                
                                Text("50°")
                                    .font(.system(size: 28, weight: .medium, design: .default))
                                
                                
                            }
                            .padding(10)
                        }
                        .padding()
                    }
                }
                
                Spacer()
                
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WeatherView()
            WeatherView()
                .preferredColorScheme(.dark)
        }
    }
}

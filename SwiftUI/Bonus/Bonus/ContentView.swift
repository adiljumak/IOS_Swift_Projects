//
//  ContentView.swift
//  BonusAssignment
//
//  Created by Adilzhan Jumakanov on 22.04.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isDay = true
    var body: some View {
        ZStack {
            BackgroundView(topColor: isDay ? Color(#colorLiteral(red: 0.2097135484, green: 0.417529881, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), bottomColor: isDay ? Color(#colorLiteral(red: 0, green: 0.9301835299, blue: 0.9242298007, alpha: 1)) : Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
            VStack {
               
                CityTextView(cityName: "Almaty, KZ")
                
                
                WeatherView(imageName: isDay ? "cloud.sun.fill" : "moon.stars.fill", temperature: 22)
                
                HStack(spacing: 35) {
                    DayView(dayOfWeek: "TUE",
                            imageNameOfWeather: "cloud.sun.fill",
                            temperature: 14)
                    DayView(dayOfWeek: "WD",
                            imageNameOfWeather: "cloud.sun.fill",
                            temperature: 22)
                    DayView(dayOfWeek: "THU",
                            imageNameOfWeather: "wind",
                            temperature: 21)
                    DayView(dayOfWeek: "FRI",
                            imageNameOfWeather: "wind",
                            temperature: 11)
                    DayView(dayOfWeek: "SAT",
                            imageNameOfWeather: "cloud.sun.fill",
                            temperature: 9)
                    
                    
                    
                }
                
                Spacer()
                
                Button {
                    isDay.toggle()
                } label: {
                    ButtonView(title: "Change day time", textColor: Color.blue, backgroundColor: Color.white)
                }
                
                Spacer()
                    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DayView: View {
    
    var dayOfWeek: String
    var imageNameOfWeather: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 21, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageNameOfWeather)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50, alignment: .center)
            
            Text("\(temperature)°C")
                .font(.system(size: 22, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView: View {
    
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 40, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(40)
    }
}


struct WeatherView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200, alignment: .center)
            
        
        Text("\(temperature)°C")
            .font(.system(size: 70, weight: .medium, design: .default))
            .foregroundColor(.white)
        }
        .padding(.bottom, 50)
    }
}

struct ButtonView: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 300, height: 60, alignment: .center)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(15)
    }
}

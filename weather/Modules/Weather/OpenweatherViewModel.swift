//
//  OpenweatherViewModel.swift
//  whether
//
//  Created by Дмитрий Маринин on 17.11.2020.
//

import Foundation

struct OpenweatherViewModel {
    let openweather: Openweather
    
    var currentTemp: String {
        return "\(openweather.main.temp) - текущаая температура"
    }
    
    var humidity: String {
        return "\(openweather.main.humidity) - текущая влажность"
    }
    
    var windSpeed: String {
        return "\(openweather.wind.speed) - текущая скорость ветра"
    }
    
    /// Делаю уже на скорую руку, времени нет
    /// Так же можно было вынести в роутер
    var iconsUrls: [URL?] {
        return openweather.weather.map({ URL(string: "http://openweathermap.org/img/wn/\($0.icon)@2x.png") })
    }
    
    // MARK: - Init
    
    init(openweather: Openweather) {
        self.openweather = openweather
        
    }

}


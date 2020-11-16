//
//  Openweather.swift
//  weather
//
//  Created by Дмитрий Маринин on 17.11.2020.
//

import Foundation

struct Openweather {
    var weather: [Weather]
    var main: Main
    var wind: Wind
}


// MARK: - Coding Keys

extension Openweather: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case weather
        case main
        case wind
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        weather = try container.decode([Weather].self, forKey: .weather)
        main = try container.decode(Main.self, forKey: .main)
        wind = try container.decode(Wind.self, forKey: .wind)
    }
}

//
//  Weather.swift
//  weather
//
//  Created by Дмитрий Маринин on 16.11.2020.
//

import Foundation

struct Weather {
    var icon: String
}

struct Main {
    var temp: Float
    var humidity: Float
}


struct Wind {
    var speed: Float
    var deg: Int
}


// MARK: - Coding Keys

extension Weather: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case icon
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        icon = try container.decode(String.self, forKey: .icon)
    }
}

extension Main: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case temp
        case humidity
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        temp = try container.decode(Float.self, forKey: .temp)
        humidity = try container.decode(Float.self, forKey: .humidity)
    }
}

extension Wind: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case speed
        case deg
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        speed = try container.decode(Float.self, forKey: .speed)
        deg = try container.decode(Int.self, forKey: .deg)
    }
}

//
//  Coordinate.swift
//  weather
//
//  Created by Дмитрий Маринин on 17.11.2020.
//

import Foundation

struct Coordinate {
    var lat: Double
    var lon: Double
}

// MARK: - Coding Keys

extension Coordinate {
    
    enum Keys: String {
        case lat = "lat"
        case lon = "lon"
    }
    
}

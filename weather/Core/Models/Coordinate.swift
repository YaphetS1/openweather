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
    
    // With default coordinate of City Moscow
    init() {
        lat = 37.618423
        lon = 55.751244
    }
    
    init(lat: Double, lon: Double) {
        self.lat = lat
        self.lon = lon
    }
}

// MARK: - Coding Keys

extension Coordinate {
    
    enum Keys: String {
        case lat = "lat"
        case lon = "lon"
    }
    
}

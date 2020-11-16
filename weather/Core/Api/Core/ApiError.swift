//
//  ApiError.swift
//  weather
//
//  Created by Дмитрий Маринин on 16.11.2020.
//

import Foundation

enum WeatherError: Error {
    case requestFailed
    case noData
    case serializationFailed
    case parsingFailed
}

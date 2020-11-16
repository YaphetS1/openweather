//
//  OpenweatherRouter.swift
//  weather
//
//  Created by Дмитрий Маринин on 17.11.2020.
//

import Foundation

// format: http://api.openweathermap.org/data/2.5/weather?lat=40&lon=45&APPID=API
enum OpenweatherRouter: ApiRouter {
    
    case getWeather(coordinate: Coordinate)
    
    var path: String {
        switch self {
        case .getWeather: return "/"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var parameters: Parameters {
        var parameters: Parameters = [:]
        switch self {
        case .getWeather(let coordinate):
            parameters["lat"] = coordinate.lat
            parameters["lon"] = coordinate.lon
            parameters["units"] = "imperial" // static
            parameters["APPID"] = ApiConfig.apiToken
        }
        return parameters
    }
    
}

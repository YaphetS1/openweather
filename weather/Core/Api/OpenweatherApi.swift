//
//  OpenweatherApi.swift
//  weather
//
//  Created by Дмитрий Маринин on 17.11.2020.
//

import Foundation
import UIKit

extension Api {
    
    // this is very simple and just has the temp as a Float, and description as a String,
    // you might want to replace this with a more robust result
    enum WeatherResult {
        case success(Openweather)
        case failure(WeatherError)
    }
    
    typealias WeatherCompletion = (WeatherResult) -> Void
    
    func getWeather(coordinate: Coordinate, completion: @escaping WeatherCompletion) {
        // 1 route
        let route = OpenweatherRouter.getWeather(coordinate: coordinate)
        
        getData(from: route.asURLRequest()) { data, URLResponse, requestError in
            guard let data = data else {
                if let _ = requestError {
                    completion(.failure(.requestFailed))
                } else {
                    print("WeatherController: data is nil, but there is no error!")
                }
                return
            }
            
            do {
                let weatherResult = try JSONDecoder().decode(Openweather.self, from: data)
                
                completion(.success(weatherResult))
            } catch {
                completion(.failure(.serializationFailed))
            }
        }
    }
}


extension UIImageView {
    
    func downloadImage(from url: URL) {
        Api.instance.getData(from: url) { [weak self] data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self?.image = UIImage(data: data)
            }
        }
    }
}

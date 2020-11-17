//
//  API.swift
//  weather
//
//  Created by Дмитрий Маринин on 16.11.2020.
//

import Foundation
import CoreLocation


// This class can be used for adopt or some Server Trust Policy
final class Api {
    
    static let instance: Api = Api()
    
    let session = URLSession.shared
    
    // singleton should not be initialized elsewhere
    fileprivate init() {}
    
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        session.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func getData(from url: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        session.dataTask(with: url, completionHandler: completion).resume()
    }
}

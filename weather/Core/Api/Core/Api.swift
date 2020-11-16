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
    
    static let shared = Api()
    
    let session = URLSession.shared
    
    // singleton should not be initialized elsewhere
    fileprivate init() {}
    
}

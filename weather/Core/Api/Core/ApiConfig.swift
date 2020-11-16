//
//  ApiConfig.swift
//  weather
//
//  Created by Дмитрий Маринин on 16.11.2020.
//

import Foundation

struct ApiConfig {
    
    static var serviceInfo: [String:  Any] {
        guard
            let info = Bundle.main.infoDictionary,
            let services = info["Remote services"] as? [String:  Any]
        else {
            fatalError("Cannot get Service Info from info.plist")
        }
        return services
    }
    
    static var baseURL: URL {
        guard let urlString = serviceInfo["Base URL"] as? String,
              let url = URL(string: urlString) else {
            fatalError("Cannot get Base URL from info.plist")
        }
        return url
    }
    
    static var apiToken: String {
        guard let token = serviceInfo["Api token"] as? String else {
            fatalError("Cannot get Api token from info.plist")
        }
        return token
    }
    
    static var installAttributes: String? {
        #if DEBUG
        return "DEBUG"
        #else
        return nil
        #endif
    }
    
}

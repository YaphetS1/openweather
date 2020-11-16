//
//  RequestParameters.swift
//  weather
//
//  Created by Дмитрий Маринин on 17.11.2020.
//

import Foundation

protocol RequestParameters {
    func asParameters() -> Parameters
}

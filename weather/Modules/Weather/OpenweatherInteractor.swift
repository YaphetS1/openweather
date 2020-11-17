//
//  OpenweatherInteractor.swift
//  whether
//
//  Created by Дмитрий Маринин on 17.11.2020.
//

import Foundation

typealias EmptyCompletion = () -> Void
typealias ErrorCompletion = (Error?) -> Void
typealias ErrorCompletionWithModel<T> = (Error?, T?) -> Void

protocol OpenweatherInteractorProtocol: class {
    func refresh(completion: @escaping ErrorCompletionWithModel<OpenweatherViewModel>)
    var openweatherViewModel: OpenweatherViewModel? { get }
    var isUpdating: Bool { get }
}

final class OpenweatherInteractor: OpenweatherInteractorProtocol {
    
    private let api: Api = Api.instance
    
    let coordinate: Coordinate
    var openweatherViewModel: OpenweatherViewModel?
    
    var isUpdating: Bool {
        return openweatherViewModel == nil
    }
    
    // MARK: - Init
    
    init(coordinate: Coordinate) {
        self.coordinate = coordinate
    }
    
    func refresh(completion: @escaping ErrorCompletionWithModel<OpenweatherViewModel>) {
        api.getWeather(coordinate: coordinate) { [self] weatherCompletion in
            DispatchQueue.main.async {
                switch weatherCompletion {
                case .success(let openweather):
                    openweatherViewModel = OpenweatherViewModel(openweather: openweather)
                    completion(nil, openweatherViewModel)
                case .failure(let err):
                    print(err)
                    completion(err, nil)
                }
            }
        }
    }
    
}


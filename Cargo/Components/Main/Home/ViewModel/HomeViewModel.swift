//
//  HomeViewModel.swift
//  Cargo
//
//  Created by Adilet on 7/7/23.
//

import Foundation

protocol HomeViewModelProtocol {
    func getProduct(completion: @escaping ((SuccessFailure) -> Void))
    
    var order: [Order] { get }
}

class HomeViewModel: HomeViewModelProtocol {
    let networkService = NetworkService.shared
    
    var order = [Order]()
    
    func getProduct(completion: @escaping ((SuccessFailure) -> Void)) {
        networkService.sendRequest(urlRequest: OrderRoute.getOrder.createURLRequest(), successModel: [Order].self) { [weak self] result in
            switch result {
            case .success(let model):
                self?.order = model
                completion(.success)
            case .badRequest(let error):
                debugPrint(#function, error)
                completion(.failure)
            case .failure(let error):
                debugPrint(#function, error)
                completion(.failure)
            case .unauthorized(let error):
                debugPrint(#function, error)
                completion(.failure)
            case .notFound(let error):
                debugPrint(#function, error)
                completion(.failure)
            }
        }
    }
}


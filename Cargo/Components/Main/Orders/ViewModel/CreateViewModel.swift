//
//  CreateViewModel.swift
//  Cargo
//
//  Created by Adilet on 7/7/23.
//

import Foundation

protocol CreateViewModelProtocol {
    func getProduct(params: [String: Any], completion: @escaping ((SuccessFailure) -> Void))
    
    var order: [Order] { get }
}

class CreateViewModel: CreateViewModelProtocol {
    let networkService = NetworkService.shared
    
    var order = [Order]()
    
    func getProduct(params: [String: Any] ,completion: @escaping ((SuccessFailure) -> Void)) {
        let data = try? JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        guard let data = data else { return }
        networkService.sendRequest(urlRequest: OrderRoute.postOrder(data: data).createURLRequest(), successModel: [Order].self) { [weak self] result in
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



//
//  RegisterViewModel.swift
//  Cargo
//
//  Created by Adilet on 2/7/23.
//

import Foundation

protocol RegisterViewModelProtocol {
    func signUp(params: [String : Any], completion: @escaping ((SuccessFailure) -> Void))
}

class RegisterViewModel: RegisterViewModelProtocol {
    let networkService = NetworkService.shared
    
    func signUp(params: [String : Any], completion: @escaping ((SuccessFailure) -> Void)) {
        let data = try? JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
        guard let data = data else { return }
        networkService.sendRequest(urlRequest: AuthRouter.signUp(data: data).createURLRequest(), successModel: FailureModel.self) { result in
            switch result {
            case .success(let model):
                print(model)
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


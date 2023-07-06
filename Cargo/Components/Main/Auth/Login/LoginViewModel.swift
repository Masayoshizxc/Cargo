//
//  LoginViewModel.swift
//  Cargo
//
//  Created by Adilet on 30/6/23.
//

import Foundation

enum SuccessFailure {
    case success
    case failure
}

protocol LoginViewModelProtocol {
    func login(email: String, password: String, isShipper: Bool, completion: @escaping ((SuccessFailure) -> Void))
}

class LoginViewModel: LoginViewModelProtocol {
    
    let networkService = NetworkService.shared
    
    func login(email: String, password: String, isShipper: Bool, completion: @escaping ((SuccessFailure) -> Void)) {
        print("Started\n\n\n")
        let parameters: [String : Any] = [
            "email" : email,
            "password" : password
        ]
        
//        let urlReq = URLRequest
        let data = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        guard let data = data else { return }
        let urlRequest = isShipper ? AuthRouter.signIn(data: data).createURLRequest() : AuthRouter.signInTrans(data: data).createURLRequest()
        if isShipper {
            networkService.sendRequest(urlRequest: urlRequest, successModel: LoginModel.self) { result in
                switch result {
                case .success(let model):
                    print(model)
                    let userDefaults = UserDefaultsService.shared
                    userDefaults.saveAccessToken(name: model.accessToken)
                    userDefaults.saveRole(role: model.role)
    //                userDefaults.saveUserId(id: model.id ?? 0)
                    userDefaults.isSignedIn(signedIn: true)
    //                print(userDefaults.getUserId())
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
        } else {
            networkService.sendRequest(urlRequest: urlRequest, successModel: Trans.self) { result in
                switch result {
                case .success(let model):
                    print(model)
                    let userDefaults = UserDefaultsService.shared
                    userDefaults.saveAccessToken(name: model.user.accessToken)
                    userDefaults.saveRole(role: model.user.role)
    //                userDefaults.saveUserId(id: model.id ?? 0)
                    userDefaults.isSignedIn(signedIn: true)
    //                print(userDefaults.getUserId())
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
}


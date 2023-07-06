//
//  AuthRouter.swift
//  Cargo
//
//  Created by Adilet on 6/7/23.
//

import Foundation

enum AuthRouter: BaseRouterLogin {
    case signIn(data: Data)
    case signUp(data: Data)
    case signInTrans(data: Data)
    case logout(data: Data)
    case refreshToken(data: Data)

    var path: String {
        switch self {
        case .signIn:
            return "/shipper/login"
        case .signUp:
            return "/api/auth/signup"
        case .signInTrans:
            return "/transporter/login"
        case .logout:
            return "/api/auth/logout"
        case .refreshToken:
            return "/api/auth/refreshtoken"
        }
    }
    
    var queryParameter: [URLQueryItem]? {
        switch self {
        case .signIn:
            return nil
        case .signUp:
            return nil
        case .signInTrans:
            return nil
        case .logout:
            return nil
        case .refreshToken:
            return nil
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .signIn:
            return .POST
        case .signUp:
            return .POST
        case .signInTrans:
            return .POST
        case .logout:
            return .POST
        case .refreshToken:
            return .POST
        }
    }
    
    var httpBody: Data? {
        switch self {
        case let .signIn(data):
            return data
        case let .signUp(data):
            return data
        case let .signInTrans(data):
            return data
        case let .logout(data):
            return data
        case let .refreshToken(data):
            return data
        }
    }
    
    var httpHeader: [HttpHeader]? {
        switch self {
        case .signIn:
            return nil
        case .signUp:
            return nil
        case .signInTrans:
            return nil
        case .logout:
            return nil
        case .refreshToken:
            return nil
        }
    }
    
    var port: Int {
        switch self {
        case .signIn:
            return 8085
        case .signUp:
            return 8085
        case .signInTrans:
            return 8080
        case .logout:
            return 8085
        case .refreshToken:
            return 8085
        }
    }
}


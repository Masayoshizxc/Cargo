//
//  OrderRouter.swift
//  Cargo
//
//  Created by Adilet on 7/7/23.
//

import Foundation

enum OrderRoute: BaseRouter {

    case postOrder(data: Data)
    case getOrder
    case getOrderById(id: Int)
    case postCompare(data: Data)
    
    var path: String {
        switch self {
        case .postOrder:
            return "/product/save"
        case .getOrder:
            return "/order/123"
        case let .getOrderById(id):
            return "/product/basic/\(id)"
        case .postCompare:
            return "/product/basic/comparing"
        }
    }

    var queryParameter: [URLQueryItem]? {
        switch self {
        case .postOrder:
            return nil
        case .getOrder:
            return nil
        case .getOrderById:
            return nil
        case .postCompare:
            return nil
        }
    }

    var method: HttpMethod {
        switch self {
        case .postOrder:
            return .POST
        case .getOrder:
            return .GET
        case .getOrderById:
            return .GET
        case .postCompare:
            return .POST
        }
    }

    var httpBody: Data? {
        switch self {
        case let .postOrder(data):
            return data
        case .getOrder:
            return nil
        case .getOrderById:
            return nil
        case .postCompare:
            return nil
        }
    }

    var httpHeader: [HttpHeader]? {
        switch self {
        case .postOrder:
            return nil
        case .getOrder:
            return nil
        case .getOrderById:
            return nil
        case .postCompare:
            return nil
        }
    }
    
    var port: Int {
        switch self {
        case .postOrder:
            return 8080
        case .getOrder:
            return 8081
        case . getOrderById:
            return 8081
        case .postCompare:
            return 8086
        }
    }
}


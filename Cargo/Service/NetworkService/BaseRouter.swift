//
//  BaseRouter.swift
//  Cargo
//
//  Created by Adilet on 6/7/23.
//

import Foundation

protocol BaseRouter {
    var path: String { get }
    var method: HttpMethod { get }
    var queryParameter: [URLQueryItem]? { get }
    var httpBody: Data? { get }
    var httpHeader: [HttpHeader]? { get }
    var port: Int { get }
}

extension BaseRouter {
    
    var userDefaultsService: UserDefaultsService {
        return UserDefaultsService()
    }
    var host: String {
        return "127.0.0.1"
    }
    var port: Int {
        return 8081
    }
    var scheme: String {
        return "http"
    }
    func createURLRequest() -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.port = port
        urlComponents.queryItems = queryParameter
        guard let url = urlComponents.url else {
            fatalError(URLError(.unsupportedURL).localizedDescription)
        }
        let stringURL = url.absoluteString.replacingOccurrences(of: ";", with: ":")
        var urlRequest = URLRequest(url: URL(string: stringURL)!)
        urlRequest.httpMethod = method.rawValue
        urlRequest.httpBody = httpBody
        httpHeader?.forEach { (header) in
            urlRequest.setValue(header.value, forHTTPHeaderField: header.field)
        }
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        print(url)
        
        let userDefaultsService = UserDefaultsService.shared
       
        urlRequest.setValue("Bearer \(userDefaultsService.getByKey(key: .access))", forHTTPHeaderField: "Authorization" )
 
        return urlRequest
    }
}

protocol BaseRouterLogin {
    var path: String { get }
    var method: HttpMethod { get }
    var queryParameter: [URLQueryItem]? { get }
    var httpBody: Data? { get }
    var httpHeader: [HttpHeader]? { get }
    var port: Int { get }
}

extension BaseRouterLogin {

    var userDefaultsService: UserDefaultsService {
        return UserDefaultsService()
    }
    var host: String {
        return "127.0.0.1"
    }
    var scheme: String {
        return "http"
    }
    var port: Int {
        return 8085
    }
    func createURLRequest() -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.port = port
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = queryParameter
        guard let url = urlComponents.url else {
            fatalError(URLError(.unsupportedURL).localizedDescription)
        }
        let stringURL = url.absoluteString.replacingOccurrences(of: ";", with: ":")
        var urlRequest = URLRequest(url: URL(string: stringURL)!)
        urlRequest.httpMethod = method.rawValue
        urlRequest.httpBody = httpBody
        httpHeader?.forEach { (header) in
            urlRequest.setValue(header.value, forHTTPHeaderField: header.field)
        }
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        print(urlRequest.httpMethod, urlRequest.url?.absoluteString)
        return urlRequest
    }
}


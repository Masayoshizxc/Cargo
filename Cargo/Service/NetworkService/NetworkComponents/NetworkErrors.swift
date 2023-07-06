//
//  NetworkErrors.swift
//  Cargo
//
//  Created by Adilet on 6/7/23.
//

import Foundation

enum NetworkErrors: Error {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    //case methodNotAllowed
    //case gone
    //case unsupportedMediaType
    //case internalServerError
    //case notImplemented
    //case serviceUnavailable
    case success
}


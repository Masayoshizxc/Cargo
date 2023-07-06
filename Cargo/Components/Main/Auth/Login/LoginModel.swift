//
//  LoginModel.swift
//  Cargo
//
//  Created by Adilet on 30/6/23.
//

//struct LoginModel: Codable {
//    let token : String?
//    let type : String?
//    let id : Int?
//    let username : String?
//    let email : String?
//    let phoneNumber : String?
//    let roles : [String]?
//
//    enum CodingKeys: String, CodingKey {
//
//        case token = "token"
//        case type = "type"
//        case id = "id"
//        case username = "username"
//        case email = "email"
//        case phoneNumber = "phoneNumber"
//        case roles = "roles"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        token = try values.decodeIfPresent(String.self, forKey: .token)
//        type = try values.decodeIfPresent(String.self, forKey: .type)
//        id = try values.decodeIfPresent(Int.self, forKey: .id)
//        username = try values.decodeIfPresent(String.self, forKey: .username)
//        email = try values.decodeIfPresent(String.self, forKey: .email)
//        phoneNumber = try values.decodeIfPresent(String.self, forKey: .phoneNumber)
//        roles = try values.decodeIfPresent([String].self, forKey: .roles)
//    }
//
//}
//

//struct LoginModel: Codable {
//    let token : String?
////    let type : String?
//    let id : String?
//    let name : String?
//    let email : String?
//    let phone : String?
//    let role : [String]?
//    let description : String?
//
//
//
//    enum CodingKeys: String, CodingKey {
//
//        case token = "access_token"
////        case type = "type"
//        case id = "id"
//        case name = "name"
//        case email = "email"
//        case phone = "phone"
//        case role = "role"
//        case description = "description"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        token = try values.decodeIfPresent(String.self, forKey: .token)
////        type = try values.decodeIfPresent(String.self, forKey: .type)
//        id = try values.decodeIfPresent(String.self, forKey: .id)
//        name = try values.decodeIfPresent(String.self, forKey: .name)
//        email = try values.decodeIfPresent(String.self, forKey: .email)
//        phone = try values.decodeIfPresent(String.self, forKey: .phone)
//        role = try values.decodeIfPresent([String].self, forKey: .role)
//        description = try values.decodeIfPresent(String.self, forKey: .description)
//    }
//
//}
//

import Foundation

struct Trans: Codable {
    let user: LoginModel

    enum CodingKeys: String, CodingKey {
        case user = "user"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        user = try container.decode(LoginModel.self, forKey: .user)
    }
}

struct LoginModel: Codable {
    let description, email: String
    let phone: String
    let role, createdAt, userID: String
    let accessToken, refreshToken: String

    enum CodingKeys: String, CodingKey {
//        case name = "name"
        case description = "description"
        case email = "email"
        case phone = "phone"
        case role = "role"
        case createdAt = "created_at"
        case userID = "userId"
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decode(String.self, forKey: .description)
        self.email = try container.decode(String.self, forKey: .email)
        self.phone = try container.decode(String.self, forKey: .phone)
        self.role = try container.decode(String.self, forKey: .role)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.userID = try container.decode(String.self, forKey: .userID)
        self.accessToken = try container.decode(String.self, forKey: .accessToken)
        self.refreshToken = try container.decode(String.self, forKey: .refreshToken)
    }
}
//struct LoginModel : Codable {
////    let _id : String?
//    let name : String?
//    let description : String?
//    let email : String?
//    let phone : String?
//    let confirmed : Bool?
//    let role : String?
//    let created_at : String?
//    let userId : String?
//    let confirmation_link : String?
////    let __v : Int?
//    let accessToken : String?
//    let refreshToken : String?
//
//    enum CodingKeys: String, CodingKey {
//
////        case _id = "_id"
//        case name = "name"
//        case description = "description"
//        case email = "email"
//        case phone = "phone"
//        case confirmed = "confirmed"
//        case role = "role"
//        case created_at = "created_at"
//        case userId = "userId"
//        case confirmation_link = "confirmation_link"
////        case __v = "__v"
//        case accessToken = "access_token"
//        case refreshToken = "refresh_token"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
////        _id = try values.decodeIfPresent(String.self, forKey: ._id)
//        name = try values.decodeIfPresent(String.self, forKey: .name)
//        description = try values.decodeIfPresent(String.self, forKey: .description)
//        email = try values.decodeIfPresent(String.self, forKey: .email)
//        phone = try values.decodeIfPresent(String.self, forKey: .phone)
//        confirmed = try values.decodeIfPresent(Bool.self, forKey: .confirmed)
//        role = try values.decodeIfPresent(String.self, forKey: .role)
//        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
//        userId = try values.decodeIfPresent(String.self, forKey: .userId)
//        confirmation_link = try values.decodeIfPresent(String.self, forKey: .confirmation_link)
////        __v = try values.decodeIfPresent(Int.self, forKey: .__v)
//        accessToken = try values.decodeIfPresent(String.self, forKey: .accessToken)
//        refreshToken = try values.decodeIfPresent(String.self, forKey: .refreshToken)
//    }
//
//}

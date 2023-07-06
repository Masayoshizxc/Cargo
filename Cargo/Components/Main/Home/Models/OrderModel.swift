//
//  OrderModel.swift
//  Cargo
//
//  Created by Adilet on 7/7/23.
//

import Foundation

struct Order : Codable {
    let _id : String?
    let order_id : String?
    let shipper_id : String?
    let user_id : String?
    let status : String?
    let point_a : String?
    let point_b : String?
    let price : Int?
    let document_id : String?
    let freight : String?
    let created_at : String?
    let __v : Int?

    enum CodingKeys: String, CodingKey {

        case _id = "_id"
        case order_id = "order_id"
        case shipper_id = "shipper_id"
        case user_id = "user_id"
        case status = "status"
        case point_a = "point_a"
        case point_b = "point_b"
        case price = "price"
        case document_id = "document_id"
        case freight = "freight"
        case created_at = "created_at"
        case __v = "__v"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        _id = try values.decodeIfPresent(String.self, forKey: ._id)
        order_id = try values.decodeIfPresent(String.self, forKey: .order_id)
        shipper_id = try values.decodeIfPresent(String.self, forKey: .shipper_id)
        user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        point_a = try values.decodeIfPresent(String.self, forKey: .point_a)
        point_b = try values.decodeIfPresent(String.self, forKey: .point_b)
        price = try values.decodeIfPresent(Int.self, forKey: .price)
        document_id = try values.decodeIfPresent(String.self, forKey: .document_id)
        freight = try values.decodeIfPresent(String.self, forKey: .freight)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        __v = try values.decodeIfPresent(Int.self, forKey: .__v)
    }

}


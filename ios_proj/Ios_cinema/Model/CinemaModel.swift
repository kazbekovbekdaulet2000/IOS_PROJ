//
//  CinemaModel.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 19.12.2021.
//

import Foundation

struct Cinema: Identifiable, Decodable, Hashable {
    let id: Int?
    let createdAt: String?
    let updatedAt: String?
    let name: String?
    let cinemaDescription: String?
    let imageLarge: String?
    let imageSmall: String?
    let address: String?
    let longitude: String?
    let latitude: String?
    let phone: String?
    let city: Int?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case name = "name"
        case cinemaDescription = "description"
        case imageLarge = "image_large"
        case imageSmall = "image_small"
        case address = "address"
        case longitude = "longitude"
        case latitude = "latitude"
        case phone = "phone"
        case city = "city"
    }
}

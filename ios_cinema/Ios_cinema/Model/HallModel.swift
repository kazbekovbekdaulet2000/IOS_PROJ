//
//  HallModel.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 22.12.2021.
//

import Foundation

struct Hall: Identifiable, Decodable, Hashable  {
    let id: Int?
    let createdAt: String?
    let updatedAt: String?
    let hallNo: Int?
    let vip: Bool?
    let threeD: Bool?
    let dolbyAtmos: Bool?
    let cinema: Int?
}

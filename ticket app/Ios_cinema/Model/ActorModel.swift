//
//  ActorModel.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 20.12.2021.
//

import Foundation

struct Actor: Identifiable, Decodable, Hashable {
    let id: Int?
    let createdAt: String?
    let updatedAt: String?
    let name: String?
    let originalName: String?
    let imageSmall: String?
    let imageLarge: String?
}

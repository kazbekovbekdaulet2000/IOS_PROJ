//
//  GenreModel.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 20.12.2021.
//

import Foundation

struct Genre: Identifiable, Decodable, Hashable {
    let id: Int?
    let title_ru: String?
    let title_eng: String?
}

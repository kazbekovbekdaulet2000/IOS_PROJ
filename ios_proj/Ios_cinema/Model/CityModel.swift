//
//  CityModel.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 19.12.2021.
//

import Foundation

struct City: Identifiable, Decodable, Hashable{
    let id: Int?
    let name: String?
    let name_lat: String?
}

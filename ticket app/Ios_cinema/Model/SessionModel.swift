//
//  SessionModel.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 22.12.2021.
//

import Foundation

struct Session: Identifiable, Decodable, Hashable {
    let id: Int?
    let hall: Hall?
    let film: Film?
    let created_at: String?
    let updated_at: String?
    let time: String?
    let stud_price: Int?
    let price: Int?
    let cinema: Int?
}


struct FilmSession: Identifiable, Decodable, Hashable {
    let id: Int?
    let hall: Hall?
    let film: Int?
    let created_at: String?
    let updated_at: String?
    let time: String?
    let stud_price: Int?
    let price: Int?
    let cinema: Cinema?
}

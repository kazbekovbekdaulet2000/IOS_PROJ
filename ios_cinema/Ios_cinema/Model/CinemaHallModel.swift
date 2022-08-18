//
//  Schedule.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 12.12.2021.
//

import Foundation
import SwiftUI


struct Row: Identifiable, Decodable, Hashable {
    let id: Int?
    let seats: [Seat]?
    let row_no: Int?
    let hall: Int?
}

struct Seat: Identifiable, Decodable, Hashable{
    let id: Int?
    let number: Int?
    let symbol: String?
    let picked: Bool?
    let priceReg: Int?
    let priceStud: Int?
    let empty: Bool?
    let row: Int?
}

//
//  TicketModel.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 23.12.2021.
//

import Foundation

struct Ticket: Decodable, Hashable{
    let id: Int?
    let cinema: Cinema?
    let createdAt: String?
    let updatedAt: String?
    let hall: Int?
    let row: Int?
    let seat: Int?
}

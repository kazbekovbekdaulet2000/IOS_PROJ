//
//  UserModel.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 23.12.2021.
//

import Foundation

struct User: Decodable {
    let id: Int?
    let password: String?
    let last_login: String?
    let is_superuser: Bool?
    let username: String?
    let first_name: String?
    let last_name: String?
    let email: String?
    let is_staff: Bool?
    let is_active: Bool?
    let date_joined: String?
}

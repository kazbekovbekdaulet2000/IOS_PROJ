//
//  File.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 18.12.2021.
//

import Foundation
import SwiftUI

extension Color{
    static let theme = ColorTheme()
}

struct ColorTheme {
    let text = Color("primary text")
    let accent = Color("AccentColor")
    let background = Color("Background")
    let card_back = Color("Card")
    let card_shadow = Color("Card Shadow")
    let item = Color("Item")
    
    let seat_unselected = Color("free")
    let seat_unselected_shadow = Color("free shadow")
    
    let seat_empty = Color("empty")
    let seat_empty_shadow = Color("empty shadow")
    
    let seat_selected = Color("selected")
    let seat_selected_shadow = Color("selected shadow")
    
}

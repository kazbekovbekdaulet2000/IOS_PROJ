//
//  View.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 21.12.2021.
//

import Foundation
import SwiftUI

extension View {
    
    func app_shadow(intensity: CGFloat = 8) -> some View {
        modifier(ShadowModifier(intensity: intensity))
    }
    
    func description() -> some View {
        modifier(DescritionModifier())
    }
    
    func convertDateFormatter(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        let convertedDate = dateFormatter.date(from: date)

        guard dateFormatter.date(from: date) != nil else {
            assert(false, "no date from string")
            return ""
        }
        
        dateFormatter.dateFormat = "dd MMM HH:mm    "
        let timeStamp = dateFormatter.string(from: convertedDate!)

        return timeStamp
    }
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
    
}

struct ShadowModifier: ViewModifier {
    
    var intensity: CGFloat
    
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.theme.card_shadow.opacity(0.08), radius: intensity, x: 0, y: 2)
    }
}

struct DescritionModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14))
    }
}

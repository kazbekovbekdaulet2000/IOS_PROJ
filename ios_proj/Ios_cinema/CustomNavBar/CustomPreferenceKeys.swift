//
//  CustomPreferenceKeys.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 02.12.2021.
//

import SwiftUI
import Foundation

struct CustomNavBarTitlePreference: PreferenceKey{
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

struct CustomNavBarSubtitlePreference: PreferenceKey{
    
    static var defaultValue: String? = nil
    
    static func reduce(value: inout String?, nextValue: () -> String?) {
        value = nextValue()
    }
}

struct CustomNavBarBackBtnHiddenPreference: PreferenceKey{
    
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

extension View {
    func customNavigationTitle(_ title: String) -> some View{
        preference(key: CustomNavBarTitlePreference.self, value: title)
    }
    func customNavigationSubTitle(_ subtitle: String) -> some View{
        preference(key: CustomNavBarSubtitlePreference.self, value: subtitle)
    }
    func customNavigationBtnHidden(_ hidden: Bool) -> some View{
        preference(key: CustomNavBarBackBtnHiddenPreference.self, value: hidden)
    }
}


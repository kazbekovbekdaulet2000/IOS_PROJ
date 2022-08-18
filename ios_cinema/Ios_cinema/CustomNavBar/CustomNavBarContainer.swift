//
//  CustomNavBarContainer.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 22.11.2021.
//

import SwiftUI

struct CustomNavBarContainer<Content: View>: View {
    
    let content: Content
    
    @State private var showBackBtn = true
    @State private var title: String = "Алматы"
    @State private var show_dropdown: Bool = true
    
    init(@ViewBuilder content: ()->Content){
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0){
            CustonNavBarView(title: title, show_dropdown: show_dropdown, back_btn_show: showBackBtn)
            content
        }
    }
}

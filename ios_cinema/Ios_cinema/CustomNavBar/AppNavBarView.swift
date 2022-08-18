//
//  AppNavBarView.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 22.11.2021.
//

import SwiftUI

struct AppNavBarView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: ()-> Content){
        self.content = content()
    }
    
    var body: some View {
        CustomNavView{
            ZStack(){
                content
            }
        }
    }
}

extension AppNavBarView {
    private var defaultNavView: some View{
        Text("empty")
    }
}

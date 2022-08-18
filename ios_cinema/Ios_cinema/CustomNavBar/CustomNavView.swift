//
//  CustomNavView.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 22.11.2021.
//

import SwiftUI

struct CustomNavView<Content:View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: ()-> Content){
        self.content = content()
    }
        
    var body: some View {
        NavigationView{
            CustomNavBarContainer{
                content
            }
            .navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

extension UINavigationController{
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}

//
//  CustomNavLink.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 22.11.2021.
//

import SwiftUI

struct CustomNavLink<Label: View, Destination: View> : View {
    
    let destination: Destination
    let label: Label
    
    init(destination: Destination, @ViewBuilder label: () -> Label){
        self.destination = destination
        self.label = label()
    }
    
    var body: some View {
        NavigationLink(
            destination: CustomNavBarContainer(content: {
                destination
                Spacer()
            }).navigationBarHidden(true),
            label: {label}
        )
    }
}

//
//  SearchBar.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 22.11.2021.
//

import SwiftUI

struct SearchBar: View {
    
    @State private var searchText = ""
    @FocusState private var nameIsFocused: Bool
    
    var body: some View {
        HStack(alignment: .center){
            Button(action: {nameIsFocused = false}, label: {Image("search").padding(4.0)})
            TextField("Фильм или кинотеатр", text: $searchText)
                .focused($nameIsFocused)
            Spacer()
        }
        .padding(12)
        .background(Color("Accent"))
        .foregroundColor(Color("primary text"))
        .cornerRadius(16)
        .onSubmit {
            nameIsFocused = false
        }
    }
}


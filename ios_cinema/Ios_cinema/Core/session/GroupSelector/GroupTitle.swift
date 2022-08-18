//
//  GroupTitle.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 22.11.2021.
//

import SwiftUI

enum GroupType {
    case allFilms
    case cinemas
    case popular
    case soon
}

struct GroupTitle: View {
    
    @EnvironmentObject var cinemas: CinemasViewModel
    @EnvironmentObject var films: FilmsViewModel
    @EnvironmentObject var token: Tokens
    
    
    private var title: String = "Все Фильмы"
    
    private var type: GroupType = .allFilms
    
    init(title: String = "Все Фильмы", type: GroupType){
        self.title = title
        self.type = type
    }
    
    var body: some View {
        HStack{
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
            Spacer()
            
            NavigationLink {
                if type == .allFilms{
                    filmsListView()
                        .environmentObject(films)
                }else if type == .cinemas {
                    CinemaListView()
                        .environmentObject(cinemas)
                        .environmentObject(token)
                }
            } label: {
                Text("Все")
            }

        }.padding(.top, 16)
    }
}

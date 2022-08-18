//
//  HomeView.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 19.12.2021.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var token: Tokens
    @EnvironmentObject private var films: FilmsViewModel
    @EnvironmentObject var genres: GroupSelectorViewModel
    @EnvironmentObject var cinemas: CinemasViewModel
    
    
    @State private var searchText = ""
    @FocusState private var nameIsFocused: Bool
    
    var body: some View {
        HStack(alignment: .center){
            Button(action: {
                films.getSearchFilms()
            }, label: {Image("search").padding(4.0)})
            TextField("Фильм или кинотеатр", text: $films.searchText)
                .focused($nameIsFocused)
            Spacer()
        }
        .padding(12)
        .background(Color("Accent"))
        .foregroundColor(Color("primary text"))
        .cornerRadius(16)
        .onSubmit {
            films.getSearchFilms()
            nameIsFocused.toggle()
        }
        .padding(.vertical, 12)
        
        Text(searchText)
        
        if(!nameIsFocused){
            Group {
                GroupSelector()
                    .environmentObject(genres)
                
                GroupTitle(title: "Сейчас в кино", type: .allFilms)
                    .environmentObject(films)
                    .environmentObject(token)
                
                FilmsView()
                    .environmentObject(films)
                    .environmentObject(token)
                
                GroupTitle(title: "Кинотеатры", type: .cinemas)
                    .environmentObject(cinemas)
                    .environmentObject(token)
                
                СinemasView()
                    .environmentObject(cinemas)
                    .environmentObject(token)
                
            }.transition(.opacity.animation(.linear(duration: 0.3)))
        }else{
            VStack(spacing: 12){
                ForEach(films.searchFilms.results!, id: \.self) { film in
                    NavigationLink {
                        FilmView(film: film)
                            .environmentObject(token)
                    } label: {
                        HStack{
                            ImageView(url: film.small_img!, width: 64, height: 64, cornerRadius: 12)
                            Text(film.name!).font(.title3).fontWeight(.light)
                            Spacer()
                        }
                        .padding(6)
                        .background(Color.theme.background.cornerRadius(16))
                        .shadow(radius: 12)
                        .transition(.opacity.animation(.linear(duration: 0.3)))
                    }.foregroundColor(Color.theme.text)
                }
            }
        }
    }
}

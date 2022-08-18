//
//  CinemaScroll.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 22.11.2021.
//

import SwiftUI

struct FilmsView: View {
    
    @EnvironmentObject private var VM: FilmsViewModel
    @EnvironmentObject private var token: Tokens
    
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            if VM.films.count! > 0{
                HStack(alignment: .top, spacing: 16){
                    ForEach(VM.films.results! , id: \.self) {film in
                        FilmCard(film: film, width: 156)
                            .environmentObject(token)
                            .frame(width: 156, height: 300)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 8)
            }else{
                ProgressView().frame(width: UIScreen.screenWidth, height: 300)
            }
        }
        .navigationTitle(Text("Главное"))
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal, -24)
    }
}


struct FilmCard: View{
    
    
    @EnvironmentObject private var token: Tokens
    @State var film: Film
    private var width: CGFloat
    init(film: Film, width: CGFloat = 156){
        self.film = film
        self.width = width
    }
    
    var body: some View{
        NavigationLink(destination: FilmView(film: film).environmentObject(token)){
            VStack(alignment:.leading){
                
                ImageView(url: self.film.small_img!, width: width)
                    .cornerRadius(24)
                
                VStack(alignment: .leading){
                    Text(self.film.name!)
                        .font(.headline)
                        .fontWeight(.regular)
                        .lineLimit(1)
                    Text(self.film.getGenres())
                        .font(.footnote)
                        .opacity(0.7)
                        .padding(.top, 1)
                        .lineLimit(1)
                }.padding(.horizontal,4)

            }
            .frame(width: width)
            
        }.buttonStyle(RoundedRectangleButtonStyle())
    }
}

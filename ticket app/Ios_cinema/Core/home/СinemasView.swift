//
//  СinemasView.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 19.12.2021.
//

import SwiftUI

struct СinemasView: View {
    
    @EnvironmentObject var VM: CinemasViewModel
    @EnvironmentObject var token: Tokens

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .top, spacing: 16){
                if VM.cinemas.results != nil{
                    ForEach(VM.cinemas.results!, id: \.self){ cinema in
                        CinemaCardView(cinema: cinema)
                            .environmentObject(VM)
                            .environmentObject(token)
                            .buttonStyle(RoundedRectangleButtonStyle())
                            .transition(.opacity.animation(.linear(duration: 0.5)))
                    }
                }
            }
            .padding(24)
        }.padding(.horizontal, -24)
    }
}


struct CinemaCardView: View{
    
    @State var cinema: Cinema
    
    @EnvironmentObject var cinemas: CinemasViewModel
    @EnvironmentObject var token: Tokens
    
    var body: some View {
        NavigationLink(destination: {
            CinemaView(cinema: cinema)
                .environmentObject(cinemas)
                .environmentObject(token)
        }) {
            HStack{
                VStack(alignment: .leading, spacing: 12) {
                    Image(systemName: "suit.heart.fill")
                        .padding()
                        .frame(width: 48, height: 48)
                        .foregroundColor(Color.theme.accent)
                        .background(Color.theme.accent.opacity(0.1))
                        .cornerRadius(16)
                    
                    Text(cinema.name!)
                        .font(.headline)
                        .foregroundColor(Color.theme.accent)
                        .lineLimit(1)
                    
                    Text(cinema.address!).font(.footnote).lineLimit(1)
                    
                    Text("г. Алматы").font(.footnote).lineLimit(1)
                }
                Spacer()
            }
            .frame(width: 180)
            .padding(16)
            .background(Color.theme.card_back.cornerRadius(24))
            .app_shadow(intensity: 12)
        }
    }
}

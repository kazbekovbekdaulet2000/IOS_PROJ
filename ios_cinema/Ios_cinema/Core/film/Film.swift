//
//  File.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 20.12.2021.
//

import Foundation
import SwiftUI
import AVKit

struct FilmView: View{

    @EnvironmentObject private var token: Tokens
    
    @State var film: Film
    
    @State private var isMuted: Bool = true
    @State private var isPaused: Bool = false
    @State private var showMoreDesc: Bool = false
    @State private var showMoreActors: Bool = false

    func actionSheet(url: URL?) {
        guard let urlShare = url else {return}
        let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
    
    var body: some View{
        ScrollView(.vertical, showsIndicators: false){
            
            videoPlayer()
            
            descriptionView()
            
            actors()
            
            HStack{
    
                Button {
                    actionSheet(url: film.getTrailerURL())
                } label: {
                    VStack{
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .padding(12)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(16)
                        Text("Поделиться").opacity(0.5).font(.caption)
                    }
                }.foregroundColor(Color.theme.text)
                
            }.padding(.horizontal, 24)
            
            NavigationLink {
                if(token.accessToken != ""){
                    SessionView(film: film)
                }else{
                    LoginView().environmentObject(token)
                }
            } label: {
                HStack{
                    Spacer()
                    Text("Купить билет").foregroundColor(Color.white)
                    Spacer()
                }
                .padding(16)
                .background(Color.theme.accent.cornerRadius(16))
                .padding(24)
            }

            
            Spacer()
        }
        .frame(minWidth: UIScreen.screenWidth, minHeight: (UIScreen.screenHeight-(UIScreen.screenWidth/1.5)))
        .background(Color.theme.background.cornerRadius(24))
        .ignoresSafeArea(edges: .top)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack{
                    Image(systemName: isPaused ? "play" : "pause")
                        .foregroundColor(Color.theme.accent)
                        .padding(12)
                        .onTapGesture {
                            isPaused.toggle()
                        }
                        .animation(.spring(), value: isPaused)
                }
            }
        }
        .onDisappear(perform: {
            isPaused = true
        })
        .navigationBarItems(
            trailing: HStack{
                Image(systemName: isMuted ? "speaker.slash" : "speaker")
                    .foregroundColor(Color.theme.accent)
                    .padding(12)
                    .onTapGesture {
                        isMuted.toggle()
                    }
                    .animation(.spring(), value: isMuted)
            }
        )
    }
}


extension FilmView {
    
    func videoPlayer() ->some View {
        return LazyVStack{
            VideoView(src: film.getTrailerURL(), muted: $isMuted, pause: $isPaused)
                .frame(width: nil, height: UIScreen.screenWidth/1.3, alignment: .center)
                .ignoresSafeArea(edges: .top)
                .shadow(color: Color.black.opacity(0.7), radius: 12, x: 0, y: 2)
                .onAppear(perform: {
                    isPaused = false
                })
                .onDisappear {
                    isPaused = true
                }
        }
        .cornerRadius(24, corners: .bottomRight)
        .cornerRadius(24, corners: .bottomLeft)
    }
    
    func descriptionView() -> some View {
        return VStack{
            HStack(alignment: .top){
                Text(film.name_rus!)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
            }.padding(.horizontal, 24)
            .padding(.top, 12)

            HStack(alignment: .top, spacing: 12, content: {
                Text("2021")
                Text(film.getDuriation())
                Text("\(film.age_restriction!)+")
                Text("IMAX®")
                Spacer()
            })
            .opacity(0.5)
            .padding(.horizontal, 24)
            
            Section(footer:
                VStack(alignment: .leading) {
                    if !showMoreDesc {
                        Text(film.description!).lineLimit(3).font(.body)
                    }else{
                        Text(film.description!).font(.body)
                    }
                    Button(showMoreDesc ? "Показать меньше" : "Показать больше", action: {self.showMoreDesc.toggle()}).font(.footnote)
            }) {
                EmptyView()
            }.padding(24)
        }
    }
    
    func actors() -> some View {
        return VStack{
            VStack(alignment: .leading, spacing: 8){
                Text("В главных ролях:").font(.footnote).fontWeight(.regular)
                HStack(){
                    Text(film.getActors()).font(.body).fontWeight(.regular).lineLimit(showMoreActors ? 100 : 1)
                    
                    if(!showMoreActors){
                        Button("еще"){
                            showMoreActors.toggle()
                        }
                        .foregroundColor(Color.theme.accent)
                    }
                    Spacer()
                }
            }
                .padding(.horizontal, 24)
                .padding(.bottom, 16)
            
            VStack(alignment: .leading, spacing: 8){
                Text("Режиссёр").font(.footnote).fontWeight(.regular)
                HStack(){
                    Text(film.getDirector()).font(.body).fontWeight(.regular).lineLimit(1)
                    Spacer()
                }
            }
                .padding(.horizontal, 24)
                .padding(.bottom, 16)
            
            VStack(alignment: .leading, spacing: 8){
                Text("Страны:").font(.footnote).fontWeight(.regular)
                HStack(){
                    Text(film.getCountries()).font(.body).fontWeight(.regular).lineLimit(1)
                    Spacer()
                }
            }
                .padding(.horizontal, 24)
                .padding(.bottom, 16)
        }
    }
    
}

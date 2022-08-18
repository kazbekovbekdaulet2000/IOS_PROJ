//
//  CinemaVIew.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 19.12.2021.
//

import SwiftUI

struct CinemaView: View {
    
    @EnvironmentObject var cinemas: CinemasViewModel
    @EnvironmentObject var token: Tokens
    
    @State var cinema: Cinema
    @State var showMore: Bool = false
    
    init(cinema: Cinema){
        self.cinema = cinema
    }
    
    var body: some View {
        ZStack{
            ZStack(alignment: .top){
                Color.clear
                ImageView(url: cinema.imageLarge!, width: UIScreen.screenWidth, height: UIScreen.screenWidth)
                    .ignoresSafeArea(edges: .top)
            }
            ScrollView(.vertical, showsIndicators: false){
                Spacer().frame(height: (UIScreen.screenWidth/2))
                
                VStack(alignment:.leading, spacing:12){
                    HStack(alignment: .top){
                        Text(cinema.name!)
                            .font(.title3)
                            .fontWeight(.medium)
                        Spacer()
                    }
                    .padding(.top, 48)
                    .padding(.horizontal, 24)
    
                    VStack(alignment: .leading, spacing: 8){
                        Text("Адрес:")
                            .fontWeight(.regular)
                            .foregroundColor(Color.theme.accent)
                        HStack(){
                            Text(cinema.address!).font(.body).fontWeight(.regular)
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 16)
                
                    VStack(alignment: .leading, spacing: 8){
                        Text("Описание:")
                            .fontWeight(.regular)
                            .foregroundColor(Color.theme.accent)
                        
                        Section(footer:
                            VStack(alignment: .leading) {
                                if showMore {
                                    Text(cinema.cinemaDescription!).description()
                                }
                                if !showMore{
                                    Text(cinema.cinemaDescription!)
                                        .description()
                                        .lineLimit(6)
                                }
                                Button(showMore ? "Показать меньше" : "Показать больше", action: {self.showMore.toggle()}).font(.footnote)
                        }) {
                            EmptyView()
                        }
                    }.padding(.horizontal, 24)
                        .padding(.bottom, 16)
                    
                    CinamaSessionsView(cinema: cinema)
                        .environmentObject(cinemas)
                        .environmentObject(token)
                    
                    Spacer()
                }
                .frame(minWidth: UIScreen.screenWidth, minHeight: (UIScreen.screenHeight-(UIScreen.screenWidth/1.5)))
                .background(Color.theme.background.cornerRadius(24))
                .shadow(color: Color.theme.card_shadow.opacity(0.08), radius: 16, x: 0, y: -8)
                .mask(Rectangle().padding(.top, -20))

            }
            .frame(width: UIScreen.screenWidth)
        }
    }
}


struct CinamaSessionsView: View {
    
    @EnvironmentObject var vm: CinemasViewModel
    @EnvironmentObject var token: Tokens
    
    var cinema: Cinema
    
    var body: some View {
            VStack{
                
                HStack{
                    Text("Расписание сеансов")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                    Spacer()
                }.padding(24)
                FilmSchedule(cinema_id: cinema.id!)
                    .environmentObject(vm)
                    .environmentObject(token)
                    .padding(.horizontal, 24)
            }.transition(.opacity.animation(.easeInOut(duration:0.5)))
            .onAppear {
                vm.getCinemaSessions(id: cinema.id!)
            }
    }
}


struct FilmSchedule: View {
    @EnvironmentObject var vm: CinemasViewModel
    @EnvironmentObject var token: Tokens
    
    var cinema_id: Int
    
    var body: some View {
        if vm.sessions.count! > 0 {
            VStack(spacing: 12){
                if(vm.sessions.results!.count == 0){
                    Text("пусто")
                }else{
                    ForEach(vm.sessions.results!, id: \.self) {item in
                        
                        NavigationLink {
                            if(token.accessToken != ""){
                                SessionView(film: item.film!)
                            }else{
                                LoginView()
                                    .environmentObject(token)
                            }
                        } label: {
                            HStack{
                                
                                Text("\(item.film!.name!)").padding()
                                Spacer()
                                Text("\(item.hall!.id!)")
                                Text(self.convertDateFormatter(date: item.time!)).padding()
                                
                            }
                        }.foregroundColor(Color.theme.text)
    
                    }
                    .buttonStyle(RoundedRectangleButtonStyle())
                    .background(Color.theme.card_back.cornerRadius(16))
                        .app_shadow(intensity: 12)
                }
            }
        }
    }
}

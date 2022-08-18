//
//  ContentView.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 22.11.2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var vm: HomeViewModel
    @EnvironmentObject var token: Tokens
    @EnvironmentObject var films: FilmsViewModel
    @EnvironmentObject var genres: GroupSelectorViewModel
    @EnvironmentObject var cinemas: CinemasViewModel
    
    init(){
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    var body: some View {
        NavigationView(content: {
            ScrollView(.vertical, showsIndicators: false){
                VStack(content: {
                    HomeView()
                        .environmentObject(token)
                        .environmentObject(films)
                        .environmentObject(genres)
                        .environmentObject(cinemas)
                    
                    Spacer()
                }).padding(.horizontal, 24.0)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing:
                    HStack {
                        if(token.accessToken != ""){
                            NavigationLink {
                                ProfileView()
                                    .environmentObject(token)
                            } label: {
                                Image(systemName: "person.fill")
                                    .padding(12)
                            }.foregroundColor(Color.theme.text)
                        }else{
                            Image(systemName: "person.fill.questionmark")
                                .padding(12)
                                .onTapGesture {
                                    token.noLogin.toggle()
                                }
                        }
                    }
            )
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Menu((vm.city?.name ?? "")) {
                            if(vm.cities.count! > 0){
                                ForEach(vm.cities.results!, id: \.self){ city in
                                    Button(city.name!, action: {
                                        vm.change_city(city:city)
                                        cinemas.getCinemas()
                                    })
                                }
                            }
                        }
                        .font(.title3.weight(.medium))
                        .foregroundColor(Color("primary text"))
                    }
                }
            }
            .navigationViewStyle(.columns)
            .sheet(isPresented: $token.noLogin, content: {
                LoginView()
                    .environmentObject(token)
            })
        })
    }
}

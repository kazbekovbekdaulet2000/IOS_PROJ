//
//  CinemaListView.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 22.12.2021.
//

import SwiftUI

struct CinemaListView: View {
    
    @EnvironmentObject var vm: CinemasViewModel
    @EnvironmentObject var token: Tokens
    
    @State var showFilterSheet: Bool = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            if vm.cinemas.count! > 0{
                ForEach(vm.cinemas.results!, id: \.self) {cinema in
                    NavigationLink {
                        CinemaView(cinema: cinema)
                            .environmentObject(vm)
                            .environmentObject(token)
                    } label: {
                        HStack{
                            ImageView(url: cinema.imageSmall!, width: 64, height: 64, cornerRadius: 12)
                                .padding(8)
                            
                            VStack(alignment: .leading){
                                Text(cinema.name!).font(.system(size: 16)).lineLimit(1)
                                    .padding(.bottom, 6)
                                Text(cinema.address!).font(.system(size: 12)).lineLimit(1)
                            }.padding(.vertical, 8)
                            
                            Spacer()
                        }
                        .background(Color.theme.card_back.cornerRadius(16))
                        .app_shadow(intensity: 8)
                        .padding(.horizontal, 24)
                    }
                    .buttonStyle(RoundedRectangleButtonStyle())
                    .foregroundColor(Color.theme.text)
                }
                .padding(.horizontal, 24)
                
                Button {
                    vm.getCinemasNextPage()
                } label: {
                    if(vm.cinemas.next != nil){
                        Text("Загрузить еще").font(.body).padding()
                    }
                }.padding(.bottom, 24)
            }
        }.padding(.horizontal, -24)
        .navigationTitle(Text("Кинотеатры"))
        .navigationBarTitleDisplayMode(.large)
    }
}

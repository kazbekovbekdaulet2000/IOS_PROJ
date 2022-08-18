//
//  filmsListView.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 20.12.2021.
//

import SwiftUI

struct filmsListView: View {
    
//    @ObservedO bject private var vm = FilmsViewModel()
    @EnvironmentObject var vm: FilmsViewModel
    
    var items: [GridItem] {
        Array(repeating: GridItem(.flexible(minimum: 100, maximum: 200), spacing: 12), count: 2)
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            Spacer().frame(height: 24)
            LazyVGrid(columns: items, alignment: .leading, spacing: 20) {
                
                ForEach(vm.films.results!, id: \.id) { film in
                    FilmCard(film: film, width: ((UIScreen.screenWidth-60)/2))
                }
                
                Spacer().onAppear {
                    vm.getFilmsPage()
                }
            }
            .padding(.horizontal, 24)
            .navigationTitle(Text("Ceйчас вкино"))
            .navigationBarTitleDisplayMode(.large)
//            .navigationBarItems(
//                trailing: HStack{
//                    Image(systemName: "slider.horizontal.3")
//                        .padding(12)
//                }
//            )
        }
    }
}

//
//  Ios_cinemaApp.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 22.11.2021.
//

import SwiftUI

@main
struct Ios_cinemaApp: App {
    
    @StateObject var vm = HomeViewModel()
    @StateObject var films = FilmsViewModel()
    @StateObject var genres = GroupSelectorViewModel()
    @StateObject var cinemas = CinemasViewModel()
    @StateObject var tokens = Tokens()
    
    init(){
        if(UserDefaults.standard.string(forKey: "access") == nil){
            UserDefaults.standard.set("", forKey: "access")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                    .environmentObject(vm)
                    .environmentObject(tokens)
                    .environmentObject(films)
                    .environmentObject(genres)
                    .environmentObject(cinemas)
        }
    }
}

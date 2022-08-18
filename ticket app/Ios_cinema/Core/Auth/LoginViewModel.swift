//
//  LoginViewModel.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 20.12.2021.
//

import Foundation

class LoginViewModel: ObservableObject{
    @Published var films: Results<Film> = Results<Film>(count: 0, next: "", previous: "", results: [])
    
    var sub: AnyCancellable?
    
    init(){
        self.getFilms()
    }
    
    func getFilms(){
        guard let url = URL(string: "http://23.111.122.219:8000/films/") else {return}
        
        sub = Network.download(url: url)
            .decode(type: Results<Film>.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: Network.handleCompletion, receiveValue: { [weak self] (data) in
                self?.films = data
                self?.sub?.cancel()
            })
    }
    
}

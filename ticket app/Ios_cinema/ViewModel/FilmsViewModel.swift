//
//  FilmViewModel.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 18.12.2021.
//

import Foundation
import Combine

class FilmsViewModel: ObservableObject{
    @Published var films: Results<Film> = Results<Film>(count: 0, next: "", previous: "", results: [])
    @Published var searchFilms: Results<Film> = Results<Film>(count: 0, next: "", previous: "", results: [])
    @Published var searchText: String = ""
    
    var sub: AnyCancellable?
    
    init(){
        self.getFilms()
    }
    
    func getFilms(){
        guard let url = URL(string: "http://localhost:8000/films/") else {return}
        
        sub = Network.download(url: url)
            .decode(type: Results<Film>.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: Network.handleCompletion, receiveValue: { [weak self] (data) in
                self?.films = data
                self?.sub?.cancel()
            })
    }
    
    func getSearchFilms(){
        guard let url = URL(string: "http://localhost:8000/films/?search=\(searchText)") else {return}
        
        sub = Network.download(url: url)
            .decode(type: Results<Film>.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: Network.handleCompletion, receiveValue: { [weak self] (data) in
                self?.searchFilms = data
                print(data)
                self?.sub?.cancel()
            })
    }
    
    func getFilmsPage(){
        if(films.next != nil){
            guard let url = URL(string: films.next!) else {return}
            sub = Network.download(url: url)
                .decode(type: Results<Film>.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: Network.handleCompletion, receiveValue: { [weak self] (data) in
                    self?.films.next = data.next
                    self?.films.results!.append(contentsOf: data.results!)
                    self?.sub?.cancel()
            })
        }
        
    }
    
}



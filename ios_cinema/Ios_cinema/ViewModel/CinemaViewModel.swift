//
//  CinemaViewModel.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 19.12.2021.
//

import Foundation
import Combine

class CinemasViewModel: ObservableObject{
 
    @Published var cinemas: Results<Cinema> = Results<Cinema>(count: 0, next: "", previous: "", results: [])
    @Published var sessions: Results<Session> = Results<Session>(count: 0, next: "", previous: "", results: [])
    
    init(){
        getCinemas()
    }
    
    var sub: AnyCancellable?
    
    func getCinemas(){
        let city = UserDefaults.standard.integer(forKey:"city")
        guard let url = URL(string: "http://localhost:8000/cinema/") else {return}
        
        sub = Network.download(url: url)
            .decode(type: Results<Cinema>.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: Network.handleCompletion, receiveValue: { [weak self] (data) in
                self?.cinemas = data
                self?.sub?.cancel()
            })
    }
    
    func reload() async {
        getCinemas()
    }
    
    func getCinemasNextPage(){
        if(cinemas.next != nil){
            guard let url = URL(string: cinemas.next!) else {return}
            sub = Network.download(url: url)
                .decode(type: Results<Cinema>.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: Network.handleCompletion, receiveValue: { [weak self] (data) in
                    self?.cinemas.next = data.next
                    self?.cinemas.results!.append(contentsOf: data.results!)
                    self?.sub?.cancel()
            })
        }
        
    }
    
    
    func getCinemaSessions(id: Int){
        guard let url = URL(string: "http://localhost:8000/cinema/\(id)/sessions/") else {return}
        
        sub = Network.download(url: url)
            .decode(type: Results<Session>.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: Network.handleCompletion, receiveValue: { [weak self] (data) in
                self?.sessions = data
                self?.sub?.cancel()
            })
    }
    
}

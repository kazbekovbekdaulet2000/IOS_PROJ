//
//  HomeViewModel.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 19.12.2021.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var cities: Results<City> = Results<City>(count: 0, next: "", previous: "", results: [])
    
    @Published var city: City? = nil
    
    @Published var error: Error? = nil
    
    var selectedCity:Int = UserDefaults.standard.integer(forKey: "city")
    
    var sub: AnyCancellable?
    
    init(){
        getCities()
    }
    
    func getCities(){
        guard let url = URL(string: "http://localhost:8000/cinema/cities/") else {return}

        sub = Network.download(url: url)
            .decode(type:  Results<City>.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: Network.handleCompletion, receiveValue: { [weak self] (data) in
                self?.cities = data
                self?.sub?.cancel()
                if let new_city = data.results!.first(where: {$0.id == self?.selectedCity}) {
                    self?.city = new_city
                }
            })
    }
    
    func change_city(city: City){
        self.city = city
        UserDefaults.standard.set(city.id!, forKey:"city")
    }
    
}

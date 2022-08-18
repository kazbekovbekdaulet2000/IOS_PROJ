//
//  GroupSelectorViewModel.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 19.12.2021.
//

import Foundation
import SwiftUI

class GroupSelectorViewModel: ObservableObject{
    
    @Published var genres: [Genre] = []
    
    let baseURL = "http://localhost:8000/films/1/genres/"

    init(){
        getGenres()
    }
    
    func getGenres(){
        guard let url = URL(string: baseURL) else {return}
        print("calling Ganres")
        URLSession.shared.dataTask(with: url){ (data, res, err) in
            guard let data = data else { return }
            guard let genres = try? JSONDecoder().decode([Genre].self, from: data) else {return}
                    
            DispatchQueue.main.async {
                self.genres = genres
            }
        }.resume()
    }
    
}

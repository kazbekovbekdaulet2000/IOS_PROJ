//
//  ImageLoader.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 18.12.2021.
//

import Foundation

class ImageLoader: ObservableObject{
    @Published var image: Data?

    func loadImage(with url: String){
        guard let imageURL = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageURL){ data, _, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.image = data
            }
        }.resume()
    }
}

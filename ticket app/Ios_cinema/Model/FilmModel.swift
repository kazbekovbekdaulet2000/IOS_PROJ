//
//  Film.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 18.12.2021.
//

import Foundation

struct Results<T: Decodable>: Decodable {
    let count: Int?
    var next: String?
    let previous: String?
    var results: [T]?
}

struct Film: Identifiable, Decodable, Hashable {
    let id: Int?
    let genres: [Genre]?
    let trailers: [Trailer]
    let actors: [Actor]?
    let directors: [Actor]?
    let countries: [Country]?
    let name: String?
    let name_origin: String?
    let name_rus: String?
    let large_img: String?
    let medium_img: String?
    let small_img: String?
    let description: String?
    let rating: Double?
    let age_restriction: Int?
    let duriation: Int?
    let startDate: String?
    let finishDate: String?
    
    func getGenres()->String{
        return genres?.reduce("", { $0 + $1.title_ru! + ", "}) ?? ""
    }
    
    func getTrailerURL()->URL{
        return URL(string: trailers[0].trailer_url!)!
    }
    
    func getActors()->String{
        return actors?.reduce("", { $0 + $1.name! + ", "}) ?? ""
    }
    
    func getDirector()->String{
        return directors![0].name!
    }
    
    func getCountries()->String{
        return countries?.reduce("", { $0 + $1.name! + ", "}) ?? ""
    }
    
    func getDuriation() -> String {
        return "\(duriation! / 3600000) ч. \(((duriation!/1000) % 3600) / 60) мин."
    }
}

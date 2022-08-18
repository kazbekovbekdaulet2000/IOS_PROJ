//
//  CinemaHallModelView.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 18.12.2021.
//

import Foundation
import Combine
import SwiftUI

struct ReservationModel: Decodable, Hashable {
    let id: Int?
    let created_at: String?
    let updated_at: String?
    let cinema: Int?
    let hall: Int?
    let row: Int?
    let seat: Int?
}
             
struct RowSeat: Equatable, Hashable {
    let row: Row
    let seat: Seat
}

class CinemHallModelView: ObservableObject{
    
    @Published var cinema: Cinema? = nil
    @Published var sessions: [FilmSession] = []
    @Published var session: FilmSession? = nil
    @Published var hall: [Row] = []
    @Published var seat: Int = 0
    
    @Published var seat_list: [RowSeat] = []
    
    
    var sub: AnyCancellable?
    
    func getHallMap(cinema_id: Int, session_id: Int){
        
        guard let url = URL(string: "http://localhost:8000/cinema/\(cinema_id)/sessions/\(session_id)/") else {return}
        
        sub = Network.download(url: url)
            .decode(type: [Row].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: Network.handleCompletion, receiveValue: { [weak self] (data) in
                self?.hall = data
                self?.sub?.cancel()
            })
    }
    
    func getSessions(film_id: Int){
        guard let url = URL(string: "http://localhost:8000/films/\(film_id)/sessions/") else {return}
        
        sub = Network.download(url: url)
            .decode(type: [FilmSession].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: Network.handleCompletion, receiveValue: { [weak self] (data) in
                self?.sessions = data
                self?.sub?.cancel()
            })
    }
    
    func reserve(row: Int, seat: Int){
        guard let url = URL(string: "http://localhost:8000/reservation/") else {return}
        
        
        let body: [String: Int] = ["cinema": session!.cinema!.id!, "hall": session!.film!, "row": row, "seat":seat ]

        guard let finalBody = try? JSONSerialization.data(withJSONObject: body) else {return}

        sub = Network.post(url: url, body: finalBody)
            .decode(type: ReservationModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: Network.handleCompletion, receiveValue: { [weak self] (data) in
                print("\(data.cinema!) - \(data.row!) - \(data.seat!)")
                self?.getHallMap(cinema_id: data.cinema!, session_id: (self?.session!.id)!)
                self?.sub?.cancel()
            })
        
    }
    
    static func equal(f:RowSeat, s:RowSeat) -> Bool {
        return (f.row.id! == s.row.id!) && (f.seat.id! == s.seat.id!)
    }
    
    func addSeat(row: Row, seat: Seat){
        let seat = RowSeat(row: row, seat: seat)
        seat_list.removeAll()
        seat_list.append(seat)
        
    }
    
    func isSelected(row: Row, seat: Seat) -> Bool{
        let seat = RowSeat(row: row, seat: seat)
        if(seat_list.contains(seat)){
            return true
        }
        return false
    }
    
    func getSumPrice() -> Int {
        return session!.price! * seat_list.count
    }
    
    
    func reserveMany() {
        seat_list.forEach { seat in
            self.reserve(row: seat.row.id!, seat: seat.seat.id!)
        }
    }
    
}

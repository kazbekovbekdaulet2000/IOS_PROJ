//
//  TicketModelView.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 23.12.2021.
//

import SwiftUI
import Combine

class TicketModelView: ObservableObject {
    @Published var ticketList: Results<Ticket> = Results<Ticket>(count: 0, next: "", previous: "", results: [])

    var sub: AnyCancellable?
    
    init(){
        self.getTickets()
    }
    
    func getTickets(){
        guard let url = URL(string: "http://localhost:8000/reservation/") else {return}
        
        sub = Network.download(url: url)
            .decode(type: Results<Ticket>.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: Network.handleCompletion, receiveValue: { [weak self] (data) in
                self?.ticketList = data
                self?.sub?.cancel()
            })
    }
    
    func getTicketPage(){
        if(ticketList.next != nil){
            guard let url = URL(string: ticketList.next!) else {return}
            sub = Network.download(url: url)
                .decode(type: Results<Ticket>.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: Network.handleCompletion, receiveValue: { [weak self] (data) in
                    self?.ticketList.next = data.next
                    self?.ticketList.results!.append(contentsOf: data.results!)
                    self?.sub?.cancel()
            })
        }
        
    }
    
}

//
//  Tickets.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 23.12.2021.
//

import SwiftUI

struct Tickets: View {
    @StateObject var tickets = TicketModelView()
    
    var body: some View {
        ScrollView{
            ForEach(tickets.ticketList.results!, id: \.self){ ticket in
                HStack{
                    Text(ticket.cinema!.name!)
                    Spacer()
                }.padding()
                    .background(Color.theme.background.cornerRadius(12))
                    .shadow(radius: 12)
            }.padding(.horizontal, 24)
                .padding(.vertical, 6)
            
            Button {
                tickets.getTicketPage()
            } label: {
                if(tickets.ticketList.next != nil){
                    Text("Загрузить еще").font(.body).padding()
                }
            }.padding(.bottom, 24)
        }.navigationTitle("Мои билеты")
    }
}

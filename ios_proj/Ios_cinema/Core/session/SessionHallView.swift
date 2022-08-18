//
//  FilmDetail.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 01.12.2021.
//

import SwiftUI

struct FilmDetail: View {
    
    @StateObject var VM = CinemHallModelView()
    
    @State private var row: Int? = nil
    @State private var seat: Int? = nil
    
    
    
    func select_seat(row: Int, seat: Int){
        self.row = row
        self.seat = seat
    }

    var cinema_id: Int
    var session_id: Int
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            if VM.hall.count > 0{
                VStack{
                    
                    HStack{
                        Spacer()
                        RoundedRectangle(cornerRadius: 4)
                            .foregroundColor(Color.theme.accent)
                            .frame(width: 300, height: 8, alignment: .center)
                        Spacer()
                    }.padding(.bottom, 48)
                    
                    ForEach(VM.hall, id: \.self) {row in
                        HStack{
                            Text("Ряд \(row.row_no!)")
                            Spacer()
                            ForEach(row.seats!, id: \.self) {seat in
                                let selected = row.id! == self.row && seat.id! == self.seat && !seat.empty!
                                let empty = seat.picked!
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(empty ? Color.red.opacity(0.5) : Color.gray.opacity(0.2))
                                    .opacity(seat.empty! ? 0 : 1)
                                    .frame(width: 36, height: 36, alignment: .leading)
                                    .overlay(seat.empty! ? nil : RoundedRectangle(cornerRadius: 8).fill(selected ? Color.green.opacity(0.2) : Color.gray.opacity(0.2)).frame(width: 36, height: 14).position(x: 18, y: 30))
                                    .onTapGesture {
                                        if(!seat.empty!){
                                            print("\(row.id!), \(seat.id!)")
                                            select_seat(row: row.id!, seat: seat.id!)
                                        }
                                    }
                            }
                            Spacer()
                        }.padding(.horizontal)
                    }
                }
            }
        }.onAppear {
            VM.getHallMap(cinema_id: cinema_id, session_id: session_id)
        }
    }
}

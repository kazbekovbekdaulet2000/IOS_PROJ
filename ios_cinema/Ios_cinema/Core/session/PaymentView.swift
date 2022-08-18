//
//  PaymentView.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 23.12.2021.
//

import SwiftUI

struct PaymentView: View {
    
    @EnvironmentObject var sessionModelView:CinemHallModelView
    @State var session: FilmSession?
    @State var film: Film
    
    var body: some View {
        VStack{
            HStack{
                Text(film.name!)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                
                Spacer()
                Text("IMAX 3D").font(.footnote)
                Image(systemName: "smallcircle.filled.circle.fill")
                Text("\(film.age_restriction!)+")
            }.padding(.horizontal, 24)
                .padding(.vertical, 12)
            
            HStack{
                Text(session?.cinema?.name! ?? "")
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                
                Spacer()
            }.padding(.horizontal, 24)
            
            VStack(spacing: 8){
                ForEach(sessionModelView.seat_list, id: \.self){ seat in
                    HStack{
                        Text("Зал \(sessionModelView.hall[0].hall!) IMAX \(seat.row.row_no!) ряд, \(seat.seat.number!) место")
                            .font(.system(size: 14))
                            .fontWeight(.regular)
                        
                        Spacer()
                    }
                }
                .padding(.horizontal, 24)
            }
            .padding(.vertical, 12)
            .background(Color.theme.card_shadow.opacity(0.05))
            
            
            HStack{
                Text("Цена")
                Spacer()
                Text("\(sessionModelView.getSumPrice()) ₸")
            }.padding(24)
            
            Spacer()
            
            Button {
                sessionModelView.reserveMany()
                
            } label: {
                HStack{
                    Spacer()
                    Text("Купить")
                        .foregroundColor(Color.white)
                    Spacer()
                }
                .padding()
                .background(Color.theme.accent.cornerRadius(16))
            }.padding(.horizontal, 24)
                .padding(.bottom, 24)
        }.navigationTitle("Выбор места")
    }
}

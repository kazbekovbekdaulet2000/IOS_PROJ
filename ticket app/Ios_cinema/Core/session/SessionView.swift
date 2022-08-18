//
//  SessionView.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 23.12.2021.
//

import SwiftUI

struct SessionView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @StateObject var sessionModelView = CinemHallModelView()
    
    @State private var row: Int? = nil
    @State private var seat: Int? = nil
    @State var film: Film
    
    
    var btnBack : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }){
            Image(systemName: "chevron.backward")
                .foregroundColor(Color.theme.accent)
        }
    }

    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false){
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
                    Text("Выберите время: ")
                    Spacer()
                    Menu {
                        if(sessionModelView.sessions.count > 0){
                            ForEach(sessionModelView.sessions, id: \.self){ session in
                                Button {
                                    sessionModelView.session = session
                                    sessionModelView.getHallMap(cinema_id: session.cinema!.id!, session_id: session.id!)
                                } label: {
                                    Text(convertDateFormatter(date: session.time!))
                                }
                            }
                        }
                    } label: {
                        if(sessionModelView.session == nil){
                            Text("Выберите")
                                .lineLimit(1)
                                .padding(8)
                                .background(Color.theme.card_shadow.opacity(0.08).cornerRadius(8))
                        }else{
                            Text(convertDateFormatter(date: (sessionModelView.session!.time!)))
                                .lineLimit(1)
                                .padding(8)
                                .background(Color.theme.card_shadow.opacity(0.08).cornerRadius(8))
                        }
                    }
                }.padding(.horizontal, 24)
//                    .padding(.vertical, 12)
                
                HStack{
                    Text(sessionModelView.session?.cinema?.name! ?? "")
                        .font(.caption)
                   
                    Spacer()
                    
                }.padding(.horizontal, 24)
                    .padding(.bottom, 12)
                
                
                if (sessionModelView.hall.count > 0) {
                    mapView().transition(.opacity.animation(.linear(duration: 0.4)))
                }
                
                if (sessionModelView.sessions.count == 0){
                    Text("На данный момент нету никаких сеансов, зайдите попозжее")
                        .font(.caption)
                        .foregroundColor(Color.red.opacity(0.7))
                }
                
            }
            
            Spacer()
            
            NavigationLink {
                PaymentView(session: sessionModelView.session, film: film)
                    .environmentObject(sessionModelView)
            } label: {
                HStack{
                    Spacer()
                    Text((sessionModelView.seat_list.count>1) ? "Выбрать места" : "Выбрать место" )
                        .foregroundColor(Color.white)
                    Spacer()
                }
                .padding()
                .background(Color.theme.accent.cornerRadius(16))
            }.padding(.horizontal, 24)
                .padding(.bottom, 24)
                .disabled((sessionModelView.session == nil || sessionModelView.seat_list.count == 0))
                .opacity((sessionModelView.session == nil || sessionModelView.seat_list.count == 0) ? 0.5 : 1)
        }
            .frame(maxWidth: UIScreen.screenWidth)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: btnBack)
            .navigationTitle("Выбор места")
            .onAppear {
                sessionModelView.getSessions(film_id: film.id!)
            }
    }
}

extension SessionView {
    func mapView() -> some View {
        return VStack{
            Image("screen")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .padding(.horizontal, 24)
                .frame(width: UIScreen.screenWidth - 96, height: 26)
            
            ScrollView(.horizontal, showsIndicators: false){
                ForEach(sessionModelView.hall, id: \.self) {row in
                    HStack{
                        Text("Ряд \(row.row_no!)").font(.caption)
                        Spacer()
                        ForEach(row.seats!, id: \.self) {seat in
                            let selected = sessionModelView.isSelected(row: row, seat: seat)
                            let empty = seat.picked!
                            RoundedRectangle(cornerRadius: 8)
                                .fill(
                                    empty ? Color.theme.seat_empty : (selected ? Color.theme.seat_selected : Color.theme.seat_unselected)
                                )
                                .opacity(seat.empty! ? 0 : 1)
                                .frame(width: 36, height: 36, alignment: .leading)
                                .overlay(seat.empty! ? nil : RoundedRectangle(cornerRadius: 8).fill(empty ? Color.theme.seat_empty_shadow : (selected ? Color.theme.seat_selected_shadow : Color.theme.seat_unselected_shadow)).frame(width: 36, height: 14).position(x: 18, y: 30))
                                .onTapGesture {
                                    if(!seat.empty! && !empty){
                                        sessionModelView.addSeat(row: row, seat: seat)
                                    }
                                }
                        }
                        Spacer()
                    }.padding(.horizontal)
                }
            }.frame(maxWidth: UIScreen.screenWidth)
            .padding(.vertical, 12)
            
            HStack(alignment: .center, spacing: 20){
                HStack{
                    Circle()
                        .fill(Color.theme.seat_selected)
                        .frame(width: 10, height: 10)
                    Text("Ваш выбор").font(.caption)
                }
                HStack{
                    Circle()
                        .fill(Color.theme.seat_empty)
                        .frame(width: 10, height: 10)
                    Text("Занято").font(.caption)
                }
                HStack{
                    Circle()
                        .fill(Color.theme.seat_unselected)
                        .frame(width: 10, height: 10)
                    Text("Свободно").font(.caption)
                }
            }.padding(.horizontal, 24)
        }
    }
}

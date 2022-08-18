//
//  CustonNavBarView.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 22.11.2021.
//

import SwiftUI

struct CustonNavBarView: View {
    
    private let cityList: [String] = ["Алматы", "Астана", "Караганда"]
    
    @Environment(\.presentationMode) var presentationMode
    
    let title: String
    let show_dropdown: Bool
    let back_btn_show: Bool
    
    func setTitle (new_title: String){
        
    }
    
    var body: some View {
        
        HStack(){
            if(back_btn_show){
                backBtn
            }
            Spacer()
            Menu {
                ForEach(cityList, id: \.self) { city in
                    Button(
                        action: {
                            setTitle(new_title: city)
                        },
                        label: {Text(city)}
                    )
                }
            } label: {
                HStack(alignment: .center, spacing: 8.0){
                    titleText
                    dropdown_menu
                }
           }
            Spacer()
            backBtn.opacity(0)
        }
        .padding(.horizontal, 24.0)
        .padding(.vertical, 12.0)
//        .accentColor(.white)
        .background(.ultraThinMaterial)
//        .blur(radius: 12)
        .font(.headline)
    }
}

extension CustonNavBarView {
    private var backBtn: some View {
        Button(
            action: { presentationMode.wrappedValue.dismiss()},
            label: {
                Image(systemName: "chevron.backward").foregroundColor(Color("primary text"))
            }
        )
    }
    
    private var titleText: some View{
        Text(title)
            .font(.title2)
            .fontWeight(.medium)
            .foregroundColor(Color("primary text"))
            .multilineTextAlignment(.center)
    }
    
    private var dropdown_menu: some View{
        Button(action: {
            
        }) {
            Image("dropdown")
        }
    }
    
}

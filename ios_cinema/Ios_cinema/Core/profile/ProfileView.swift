//
//  ProfileView.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 17.12.2021.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var auth: Tokens
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack(alignment:.leading){
            
            Image(systemName: "person.crop.circle")
                .font(.system(size: 128))
            
            HStack{
                Text("email: ")
                Text(auth.user?.email! ?? "")
                Spacer()
            }
            .padding(12)
            .background(Color.theme.background.cornerRadius(12))
            .shadow(radius: 8)
            
            HStack{
                Text("Имя пользователья: ")
                Text(auth.user?.username! ?? "")
                Spacer()
            }
            .padding(12)
            .background(Color.theme.background.cornerRadius(12))
            .shadow(radius: 8)
            
            HStack{
                Text("Фамилия: ")
                Text(auth.user?.last_name! ?? "")
                Spacer()
            }
            .padding(12)
            .background(Color.theme.background.cornerRadius(12))
            
            .shadow(radius: 8)
            
            HStack{
                Text("Имя: ")
                Text(auth.user?.first_name! ?? "")
                Spacer()
            }
            .padding(12)
            .background(Color.theme.background.cornerRadius(12))
            .shadow(radius: 8)
            
            
            NavigationLink {
                Tickets()
            } label: {
                Text("все мои билеты").padding()
            }

            
            
            Spacer()
            
            Button {
                auth.logout()
                presentation.wrappedValue.dismiss()
            } label: {
                Spacer()
                Text("Выйти")
                Spacer()
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.theme.accent.cornerRadius(16))
        }
        .onAppear(perform: {
            auth.getUser()
        })
        .padding(24)
        .navigationTitle("Профиль")
        .navigationBarTitleDisplayMode(.inline)

    }
}

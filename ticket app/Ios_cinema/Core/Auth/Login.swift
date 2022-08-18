//
//  SwiftUIView.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 20.12.2021.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var token: Tokens
    
    @State private var showModal = false

    var body: some View {
        VStack(alignment: .center){
            
            HStack{
                Text("Войти в логин")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            Spacer()
            
            Image(systemName: "person.crop.circle")
                .font(.system(size: 128))
            
            Spacer()
            
            TextField("Имя пользователья", text: $token.username)
                .padding(16)
                .background(Color("Accent"))
                .foregroundColor(Color("primary text"))
                .cornerRadius(16)
                .autocapitalization(.none)
        
            SecureField("Пароль", text: $token.password)
                .padding(16)
                .background(Color("Accent"))
                .foregroundColor(Color("primary text"))
                .cornerRadius(16)
                .autocapitalization(.none)
            
            if(token.showErrorMsg){
                Text("Данные неверные!").foregroundColor(Color.red.opacity(0.7))
            }
            
            Spacer()
            
            Button {
                token.login(username: token.username, password: token.password)
            } label: {
                HStack {
                    Spacer()
                    Image(systemName: "checkmark.circle")
                    Text("Войти")
                    Spacer()
                }
                .foregroundColor(Color.white)
                .padding()
                .background(Color.theme.accent.cornerRadius(16))
            }
        }
        .navigationBarHidden(true)
        .padding(24)
      }
}

//
//  tokens.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 20.12.2021.
//

import Foundation
import SwiftUI
import Combine

struct TokenModel: Decodable, Hashable {
    let access: String?
    let refresh: String?
}

final class Tokens: ObservableObject {
    @Published var accessToken: String = UserDefaults.standard.string(forKey: "access") ?? ""
    @Published var refreshToken: String = UserDefaults.standard.string(forKey: "refresh") ?? ""
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isValid = false
    @Published var user: User? = nil
    @Published var showErrorMsg = false
    @Published var noLogin:Bool = UserDefaults.standard.bool(forKey: "noLogin")
    
    var sub: AnyCancellable?
    
    func login(username: String, password: String) {
        guard let url = URL(string: "http://localhost:8000/auth/sign-in/") else {return}
        
        let body: [String: String] = ["username": username, "password": password]
        
        guard let finalBody = try? JSONSerialization.data(withJSONObject: body) else {return}
        
        sub = Network.post(url: url, body: finalBody)
            .decode(type: TokenModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    UserDefaults.standard.set(false, forKey: "noLogin")
                    break
                case .failure(let error):
                    self.showErrorMsg = true
                    print(error.localizedDescription)
                }
            }, receiveValue: { [weak self] (data) in
                self?.showErrorMsg = false
                self?.accessToken = data.access!
                if(self?.accessToken != ""){
                    UserDefaults.standard.set(false, forKey: "noLogin")
                    UserDefaults.standard.set(data.access!, forKey: "access")
                    UserDefaults.standard.set(data.refresh!, forKey: "refresh")
                    self?.noLogin = false
                }
                
                self?.username = ""
                self?.password = ""
                self?.refreshToken = data.refresh!
                self?.sub?.cancel()
            })
    }
    
    func logout(){
        guard let url = URL(string: "http://localhost:8000/auth/logout/") else {return}
        
        let body: [String: String] = ["refresh": UserDefaults.standard.string(forKey: "refresh")!]
        
        guard let finalBody = try? JSONSerialization.data(withJSONObject: body) else {return}
        
        sub = Network.post(url: url, body: finalBody)
            .decode(type: TokenModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }, receiveValue: { _ in})
        
        UserDefaults.standard.set("", forKey: "access")
        UserDefaults.standard.set("", forKey: "refresh")
        UserDefaults.standard.set(false, forKey: "noLogin")
        self.accessToken = ""
        self.refreshToken = ""
        self.noLogin = true
    }
    
    func getUser(){
        guard let url = URL(string: "http://localhost:8000/auth/about/") else {return}
        
        sub = Network.download(url: url)
            .decode(type: [User].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    UserDefaults.standard.set(false, forKey: "noLogin")
                    break
                case .failure(let error):
                    self.showErrorMsg = true
                    print(error.localizedDescription)
                }
            }, receiveValue: { [weak self] (data) in
                self?.user = data[0]
                self?.sub?.cancel()
            })
    }
    
}

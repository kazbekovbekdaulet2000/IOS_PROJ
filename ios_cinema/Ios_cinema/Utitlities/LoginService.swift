//
//  File.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 17.12.2021.
//

import Foundation

enum AuthError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

struct loginReqBody: Codable {
    let username: String
    let password: String
}

struct LoginResponce: Codable {
    let access: String?
    let refresh: String?
}

class WebService {
    
    func login(username: String, password: String, completion: @escaping (Result<String, AuthError>)->Void){
        
        guard let url = URL(string: "http://localhost:8000/auth/sign-in/") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        let body = loginReqBody(username: username, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request){ (data, responce, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }
            
            guard let loginResponce = try? JSONDecoder().decode(LoginResponce.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let access = loginResponce.access else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            
            completion(.success(access))
            
        }.resume()
    
    }
    
}

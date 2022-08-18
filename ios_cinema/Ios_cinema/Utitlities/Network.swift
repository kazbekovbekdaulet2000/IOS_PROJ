//
//  NetworkingManager.swift
//  Ios_cinema
//
//  Created by Бекдаулет Казбеков on 19.12.2021.
//

import Foundation
import Combine
import SwiftUI

class Network{
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
                case .badURLResponse(url: let url): return "🔥 ERROR: \(url)"
                case .unknown: return "⚠️ Unknown ERROR"
            }
        }
    }

    static func download(url: URL) -> AnyPublisher<Data, Error> {
        let accessToken = UserDefaults.standard.string(forKey: "access")
        
        var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if(accessToken != ""){
            urlRequest.setValue("Bearer \(String(describing: accessToken!))", forHTTPHeaderField: "Authorization")
        }
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap({ try handleURLResponse(output: $0, url: url) })
            .retry(3)
            .eraseToAnyPublisher()
    }

    static func post(url: URL, body: Data?) -> AnyPublisher<Data, Error>{
        let accessToken = UserDefaults.standard.string(forKey: "access")
        
        var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.httpBody = body
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if(accessToken != ""){
            urlRequest.setValue("Bearer \(String(describing: accessToken!))", forHTTPHeaderField: "Authorization")
        }
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap({ try handleURLResponse(output: $0, url: url) })
            .retry(3)
            .eraseToAnyPublisher()
    }

    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url: url)
        }
        
        return output.data
    }

    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            Alert(
                title: Text("Error messsage"),
                message: Text(error.localizedDescription),
                dismissButton: .default(Text("OK!"))
            )
        }
    }
}

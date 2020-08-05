//
//  DesafioData.swift
//  desafio-ios-marcelo-bianchi
//
//  Created by marcelo bianchi on 03/08/20.
//  Copyright © 2020 marcelo bianchi. All rights reserved.
//

import Foundation
import RxSwift

class BasicService {
    
    func url(for endpoint: String) throws -> URL {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "gateway.marvel.com"
//        components.port = 80
        components.path = "/v1/public/\(endpoint)"
        components.queryItems = [
            URLQueryItem(name: "ts", value: "1"),
            URLQueryItem(name: "apikey", value: "46593b8f8d5eca180709499860566bb4"),
            URLQueryItem(name: "hash", value: "6A73612311D6050D62DD16A8F6DD434B")

        ]
        guard let url = components.url else {throw URLError(.badURL)}
        return url

     }

}

class DesafioData: BasicService, DesafioDataProtocol {
    private var heroes: [Hero] = []
    
    func getHeroes(withFilter term: String, completion: @escaping ([Hero]?) -> Void) {
        fetchHero { [unowned self]  heroes, error in
            if let _heroes = heroes {
                self.heroes = _heroes.map { return $0 }
            }
            completion(self.heroes)
        }
    }

    
    func fetchHero(completion: @escaping ([Hero]?, Error?) -> Void) {
        let urlAcess = try? url(for: "characters")
        guard urlAcess != nil else {
            return
        }
        
        var request = URLRequest.init(url: urlAcess! as URL)
        request.httpMethod = "GET"
        
        let session = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let jsonData = data else {
                completion(nil, nil)
                return
            }
            
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let setupResponse = try decoder.decode([Hero].self, from: jsonData)
                DispatchQueue.main.async {
                    completion(setupResponse, nil)
                }
            } catch {
                print(error)
            }
        }.resume()
    }

    
}

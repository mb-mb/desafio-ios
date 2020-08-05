//
//  desafioInteractor.swift
//  desafio-ios-marcelo-bianchi
//
//  Created by marcelo bianchi on 03/08/20.
//  Copyright © 2020 marcelo bianchi. All rights reserved.
//

import Foundation


final class DesafioInteractor: DesafioInteractorProtocol {
    var data: DesafioDataProtocol!
    private let repository: DesafioDataProtocol!
    
    init(repository: DesafioDataProtocol) {
        self.repository = repository
    }
    
    
    func getHeroes(withFilter term: String, completion: @escaping ([Hero]?) -> Void) {
        repository.getHeroes(withFilter:  term) { heroes in
            completion(heroes)
        }
    }
    
}

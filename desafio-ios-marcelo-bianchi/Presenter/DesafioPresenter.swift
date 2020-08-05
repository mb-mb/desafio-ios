//
//  DesafioPresenter.swift
//  desafio-ios-marcelo-bianchi
//
//  Created by marcelo bianchi on 03/08/20.
//  Copyright © 2020 marcelo bianchi. All rights reserved.
//

import Foundation
import RxSwift

final class DesafioPresenter {
    var interactor: DesafioInteractorProtocol!
    var view: DesafioViewProtocol!
    var router: DesafioRouterProtocol!
    
    init(interactor: DesafioInteractorProtocol) {
        self.interactor = interactor        
    }

    func viewDidLoad() {
        fetchHeroes(withTerm: String())
    }
}

extension DesafioPresenter: DesafioPresenterProtocol {
    func fetchHeroes(withTerm term: String) {
        interactor.getHeroes(withFilter: term) { heroes in
            var localHeroes: [Hero] = []
            let hero = Hero()
            hero.id = 0
            hero.name = "Hero One"
            localHeroes.append(hero)
            
            if let _heroes = heroes, (_heroes.isEmpty == false) {
                localHeroes = _heroes
            }
            self.view.updatedata(heroes: localHeroes)
            
            
        }
    }
    
}

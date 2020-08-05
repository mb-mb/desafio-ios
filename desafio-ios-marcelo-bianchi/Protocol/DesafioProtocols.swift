//
//  DesafioProtocols.swift
//  desafio-ios-marcelo-bianchi
//
//  Created by marcelo bianchi on 03/08/20.
//  Copyright © 2020 marcelo bianchi. All rights reserved.
//

import Foundation
import UIKit


// MARK:- View
protocol DesafioViewProtocol: UIViewController {
    var presenter: DesafioPresenterProtocol! {get set}
    
    func updatedata(heroes: [Hero])
}

// MARK:- Presenter
protocol DesafioPresenterProtocol {
    var interactor: DesafioInteractorProtocol! {get set}
    var view: DesafioViewProtocol! {get set}
    
    func viewDidLoad()
}


// MARK:- Interactor
protocol DesafioInteractorProtocol {
    var data: DesafioDataProtocol! {get set}
    
    func getHeroes(withFilter term: String, completion: @escaping ([Hero]?)-> Void)
}


// MARK:- Data
protocol  DesafioDataProtocol {
    func getHeroes(withFilter term: String, completion: @escaping ([Hero]?)-> Void)
}

// MARK:- Router
protocol DesafioRouterProtocol {
    static func assembleModule() -> UIViewController
}

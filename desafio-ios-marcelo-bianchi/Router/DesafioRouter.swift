//
//  DesafioRouter.swift
//  desafio-ios-marcelo-bianchi
//
//  Created by marcelo bianchi on 03/08/20.
//  Copyright © 2020 marcelo bianchi. All rights reserved.
//

import Foundation
import UIKit


final class DesafioRouter { 
    
}

extension DesafioRouter: DesafioRouterProtocol {
    static func assembleModule() -> UIViewController {
                
        let repository = DesafioData() as DesafioDataProtocol
        let interactor = DesafioInteractor(repository: repository)
        let presenter = DesafioPresenter(interactor: interactor)
        let view = DesafioView()
        view.presenter = presenter
        presenter.view = view
        presenter.router = DesafioRouter()

        return view //as! UIViewController
        
    }
    
    
}

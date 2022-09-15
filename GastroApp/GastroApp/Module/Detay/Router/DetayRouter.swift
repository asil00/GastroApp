//
//  DetayRouter.swift
//  GastroApp
//
//  Created by Asilcan Çetinkaya on 12.09.2022.
//

import Foundation

class DetayRouter : PresenterToRouterDetayProtocol {
    
    static func createModule(ref: DetayVC) {
        
        let presenter = DetayPresenter()
        
        ref.detayPresenter = presenter
        
        //Presenter
        
        ref.detayPresenter?.detayInteractor = DetayInteractor()
    }
    
    
}

//
//  SepetRouter.swift
//  GastroApp
//
//  Created by Asilcan Çetinkaya on 12.09.2022.
//

import Foundation

class SepetRouter : PresenterToRouterSepetProtocol {
    
    static func createModule(ref: SepetVC) {
        
        let presenter = SepetPresenter()
        
        //View
        ref.sepetPresenter = presenter
        
        //Presenter
        ref.sepetPresenter?.sepetView = ref
        ref.sepetPresenter?.sepetInteractor = SepetInteractor()
        
        
        //Interactor
        ref.sepetPresenter?.sepetInteractor?.sepetPresenter = presenter
        
        
    }
    
    
}


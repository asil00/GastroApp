//
//  AnasayfaRouter.swift
//  GastroApp
//
//  Created by Asilcan Çetinkaya on 11.09.2022.
//

import Foundation

class AnasayfaRouter : PresenterToRouterAnasayfaProtocol {
    
    
    static func createModule(ref: AnasayfaVC) {
       
        
        let presenter = AnasayfaPresenter()
        
        //View
        
        ref.anasayfaPresenter = presenter
        
        //Presenter
        
        ref.anasayfaPresenter?.anasayfaInteractor = AnasayfaInteractor()
        ref.anasayfaPresenter?.anasayfaView = ref
        
        //Interactor
        
        ref.anasayfaPresenter?.anasayfaInteractor?.anasayfaPresenter = presenter
        
        
        
        
    }
    
    
}

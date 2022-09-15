//
//  SepetProtocol.swift
//  GastroApp
//
//  Created by Asilcan Çetinkaya on 11.09.2022.
//

import Foundation

//View -> presenter

protocol ViewToPresenterSepetProtocol {
    
    var sepetInteractor : PresenterToInteractorSepetProtocol? {get set}
    var sepetView : PresenterToViewSepetProtocol? {get set}
    func sepetiGetir()
    func urunSil(sepet_yemek_id : String)
      
}
//Presenter -> Interactor

protocol PresenterToInteractorSepetProtocol {
    var sepetPresenter : InteractorToPresenterSepetProtocol? {get set}
    func sepetiGetir()
    func yemekSil(sepet_yemek_id : String)
    
    
}
//Interactor -> presenter

protocol InteractorToPresenterSepetProtocol {
    
    func sepetiGotur(sepetListe:[SepetYemek])
    
    
}

protocol PresenterToViewSepetProtocol {
    
    func sepeteGotur(sepetListe:[SepetYemek])
    
}

protocol PresenterToRouterSepetProtocol {
    
    static func createModule(ref: SepetVC)
    
}



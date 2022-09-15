//
//  SepetPresenter.swift
//  GastroApp
//
//  Created by Asilcan Çetinkaya on 12.09.2022.
//

import Foundation

class SepetPresenter : ViewToPresenterSepetProtocol {
    
    var sepetInteractor: PresenterToInteractorSepetProtocol?
    
    var sepetView: PresenterToViewSepetProtocol?
    
    func sepetiGetir() {
        sepetInteractor?.sepetiGetir()
    }
    
    func urunSil(sepet_yemek_id: String) {
        sepetInteractor?.yemekSil(sepet_yemek_id: sepet_yemek_id)
    }
}

extension SepetPresenter : InteractorToPresenterSepetProtocol {
    func sepetiGotur(sepetListe: [SepetYemek]) {
        sepetView?.sepeteGotur(sepetListe: sepetListe)
        
    }
    
    
    
        
    
    
    
}

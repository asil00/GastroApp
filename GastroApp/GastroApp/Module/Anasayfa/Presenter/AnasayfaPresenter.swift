//
//  AnasayfaPresenter.swift
//  GastroApp
//
//  Created by Asilcan Çetinkaya on 11.09.2022.
//

import Foundation

class AnasayfaPresenter : ViewToPresenterAnasayfaProtocol {
    
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func getAllFood() {
        anasayfaInteractor?.getAllFoods()
    }
    
    
}

extension AnasayfaPresenter : InteractorToPresenterAnasayfaProtocol {
    
    func sendFoodList(yemekArray: [Yemek]) {
        anasayfaView?.sendFoodList(yemekArray: yemekArray)
    }
    
    
}

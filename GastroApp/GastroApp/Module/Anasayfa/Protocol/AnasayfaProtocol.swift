//
//  AnasayfaProtocol.swift
//  GastroApp
//
//  Created by Asilcan Çetinkaya on 11.09.2022.
//

import Foundation

protocol ViewToPresenterAnasayfaProtocol {
    
    var anasayfaInteractor : PresenterToInteractorAnasayfaProtocol? {get set}
    
    var anasayfaView : PresenterToViewAnasayfaProtocol? {get set}
    
    func getAllFood()
      
}

protocol PresenterToInteractorAnasayfaProtocol {
    
    var anasayfaPresenter : InteractorToPresenterAnasayfaProtocol? {get set}
    
    func getAllFoods()
    
}

protocol PresenterToRouterAnasayfaProtocol {
    
    static func createModule(ref: AnasayfaVC)
}

protocol InteractorToPresenterAnasayfaProtocol {
    
    func sendFoodList(yemekArray:[Yemek])
    
}
protocol PresenterToViewAnasayfaProtocol {
    
    func sendFoodList(yemekArray:[Yemek])
    
}




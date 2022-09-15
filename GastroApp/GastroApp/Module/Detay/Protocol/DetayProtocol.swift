//
//  DetayProtocol.swift
//  GastroApp
//
//  Created by Asilcan Çetinkaya on 11.09.2022.
//

import Foundation

protocol ViewToPresenterDetayProtocol {
    
    var detayInteractor : PresenterToInteractorDetayProtocol? {get set}
    
    func sepeteEkle(yemek_adi : String,yemek_resim_adi :  String,yemek_fiyat : Int,yemek_siparis_adet : Int,kullanici_adi : String)
      
}

protocol PresenterToInteractorDetayProtocol {
    
    func sepeteEkle(yemek_adi : String,yemek_resim_adi :  String,yemek_fiyat : Int,yemek_siparis_adet : Int,kullanici_adi : String)
    
}

protocol PresenterToRouterDetayProtocol {
    
    static func createModule(ref: DetayVC)
}

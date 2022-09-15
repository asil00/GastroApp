//
//  AnasayfaInteractor.swift
//  GastroApp
//
//  Created by Asilcan Çetinkaya on 11.09.2022.
//

import Foundation
import Alamofire

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    
    var anasayfaPresenter : InteractorToPresenterAnasayfaProtocol?
    
    func getAllFoods() {
        let url = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php"
        
        AF.request(url, method: .get).response { response in
            if let data = response.data {
                do {
                    
                    let yemeklerResponse = try JSONDecoder().decode(YemeklerResponse.self, from: data)
                    if let list = yemeklerResponse.yemekler {
                        self.anasayfaPresenter?.sendFoodList(yemekArray: list)
                    }
                } catch  {
                    debugPrint("Tüm yiyecekleri getirme hatası")
                    print(error.localizedDescription)
                }
            }
            
        }
        
        
    }
    
}

extension AnasayfaInteractor : InteractorToPresenterAnasayfaProtocol {
    
    func sendFoodList(yemekArray: [Yemek]) {
        
        anasayfaPresenter?.sendFoodList(yemekArray: yemekArray)
        
    }
    
}

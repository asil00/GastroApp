//
//  SepetInteractor.swift
//  GastroApp
//
//  Created by Asilcan Çetinkaya on 12.09.2022.
//

import Foundation
import Alamofire

class SepetInteractor : PresenterToInteractorSepetProtocol {
    
    var sepetPresenter: InteractorToPresenterSepetProtocol?
    
    
    func sepetiGetir() {
        let urlString = "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php"
        let parameters = ["kullanici_adi": "Asil"]
        
        
        
        AF.request(urlString, method: .post, parameters: parameters).response { response in
            if let data = response.data {
                do {
                    let json = try JSONDecoder().decode(SepetYemekResponse.self, from: data)
                    if let gelenList = json.sepet_yemekler {
                        self.sepetPresenter?.sepetiGotur(sepetListe: gelenList)
                        print(gelenList.count)
                    }
                } catch {
                    self.sepetPresenter?.sepetiGotur(sepetListe: [])
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    func yemekSil(sepet_yemek_id: String) {
        let parameters : Parameters = ["sepet_yemek_id": sepet_yemek_id,
                                       "kullanici_adi": "Asil"]
        
        let url = URL(string:"http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php")
        
        AF.request(url!, method: .post, parameters: parameters).response { response in
            if let data = response.data {
                do {
                    let json = try JSONDecoder().decode(SepetYemekResponse.self, from: data)
                    print(json)
                    self.sepetiGetir()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}

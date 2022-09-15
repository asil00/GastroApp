//
//  DetayVC.swift
//  GastroApp
//
//  Created by Asilcan Çetinkaya on 12.09.2022.
//

import UIKit
import Kingfisher

class DetayVC: UIViewController {

    @IBOutlet weak var urunMiktarLabel: UILabel!
    @IBOutlet weak var urunFiyatLabel: UILabel!
    @IBOutlet weak var urunImage: UIImageView!
    @IBOutlet weak var yemekAdLabel: UILabel!
    
    var yemek : Yemek?
    var miktar = 0
    var detayPresenter : ViewToPresenterDetayProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        DetayRouter.createModule(ref: self)
        
        if let yemek = yemek {
            
            urunFiyatLabel.text = yemek.yemek_fiyat! + " TL"
            urunImage.kf.setImage(with: gorselAl(yemek_resim_adi: yemek.yemek_resim_adi!))
            yemekAdLabel.text = yemek.yemek_adi
            
        }

       
    }
    

    @IBAction func eksiButon(_ sender: Any) {
        
        if miktar > 0 {
            miktar -= 1
            urunMiktarLabel.text = String(miktar)
        }
        
    }
    @IBAction func artıButon(_ sender: Any) {
        
        miktar += 1
        urunMiktarLabel.text = String(miktar)
    }
    
    @IBAction func sepeteEkleButon(_ sender: Any) {
        
        if let yemek = yemek {
            detayPresenter?.sepeteEkle(yemek_adi:yemek.yemek_adi!,
                                       yemek_resim_adi: yemek.yemek_resim_adi!,
                                       yemek_fiyat: Int(yemek.yemek_fiyat!)!,
                                       yemek_siparis_adet: miktar,
                                       kullanici_adi:"Asil" )
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func gorselAl(yemek_resim_adi:String)  -> URL? {
        
        let urlString = "http://kasimadalan.pe.hu/yemekler/resimler/" + yemek_resim_adi
        let url = URL(string: urlString)
        return url
        
    }
    
}

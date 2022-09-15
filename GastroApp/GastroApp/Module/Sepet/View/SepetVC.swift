//
//  SepetVC.swift
//  GastroApp
//
//  Created by Asilcan Çetinkaya on 12.09.2022.
//

import UIKit
import Kingfisher

class SepetVC: UIViewController {
    
    @IBOutlet weak var sepetTableView: UITableView!
    var sepetListe = [SepetYemek]()
    var sepetPresenter : ViewToPresenterSepetProtocol?

    @IBOutlet weak var sepetToplam: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SepetRouter.createModule(ref: self)
        
        sepetTableView.delegate = self
        sepetTableView.dataSource = self
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        sepetPresenter?.sepetiGetir()
        
    }
    @IBAction func odemeButon(_ sender: Any) {
    }
    
}

extension SepetVC : PresenterToViewSepetProtocol {
    
    func sepeteGotur(sepetListe: [SepetYemek]) {
        self.sepetListe = sepetListe
        DispatchQueue.main.async {
            self.sepetTableView.reloadData()
        }
}

}

extension SepetVC : UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sepetListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let yemek = sepetListe[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "sepetUrunCell", for: indexPath) as! SepetUrunCell
        
        cell.sepetUrunAd.text = yemek.yemek_adi
        cell.sepetUrunFiyat.text = yemek.yemek_fiyat! + " TL"
        cell.sepetUrunAdet.text = yemek.yemek_siparis_adet
        cell.adetToplam.text = String(Int(yemek.yemek_siparis_adet!)! * Int(yemek.yemek_fiyat!)!) + " TL"
        cell.sepetUrunImage.kf.setImage(with: gorselAl(yemek_resim_adi: yemek.yemek_resim_adi!))
        
        return cell
        
    }
    func gorselAl(yemek_resim_adi:String)  -> URL? {
        
        let urlString = "http://kasimadalan.pe.hu/yemekler/resimler/" + yemek_resim_adi
        let url = URL(string: urlString)
        return url
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let yemek = sepetListe[indexPath.row]
        let delete = UIContextualAction(style: .destructive,
                                        title: "Sil",
                                        handler: {_,_,_ in
            self.sepetPresenter?.urunSil(sepet_yemek_id: yemek.sepet_yemek_id!)})
        return UISwipeActionsConfiguration(actions: [delete])
        
    }
    
}

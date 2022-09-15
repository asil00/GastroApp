//
//  AnasayfaVC.swift
//  GastroApp
//
//  Created by Asilcan Çetinkaya on 11.09.2022.
//

import UIKit
import Kingfisher

class AnasayfaVC : UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var anasayfaTableview: UITableView!
    
    var yemekListesi = [Yemek]()
    var anasayfaPresenter : ViewToPresenterAnasayfaProtocol?
    var filtreliUrunler = [Yemek]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AnasayfaRouter.createModule(ref: self)
        anasayfaTableview.delegate = self
        anasayfaTableview.dataSource = self
        searchBar.delegate = self
        
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenter?.getAllFood()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let yemek = sender as? Yemek {
                let gidilecekVC = segue.destination as! DetayVC
                gidilecekVC.yemek = yemek
            }
        }
    }
}
extension AnasayfaVC : PresenterToViewAnasayfaProtocol {
    
    func sendFoodList(yemekArray: [Yemek]) {
        
        self.yemekListesi = yemekArray
        self.filtreliUrunler = yemekArray
        print(yemekListesi.count)
        DispatchQueue.main.async {
            self.anasayfaTableview.reloadData()
        }
    }
    
}
extension AnasayfaVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filtreliUrunler.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let yemek = filtreliUrunler[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "YemekCell", for: indexPath) as! YemekTableViewCell
        
        cell.urunAdiLabel.text = yemek.yemek_adi
        cell.urunFiyatLabel.text = yemek.yemek_fiyat! + " TL"
        cell.yemekImage.kf.setImage(with: gorselAl(yemek_resim_adi: yemek.yemek_resim_adi!))
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yemek = filtreliUrunler[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yemek)
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    
    func gorselAl(yemek_resim_adi:String)  -> URL? {
        
        let urlString = "http://kasimadalan.pe.hu/yemekler/resimler/" + yemek_resim_adi
        let url = URL(string: urlString)
        return url
        
    }
    
}

extension AnasayfaVC : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            filtreliUrunler = yemekListesi
        }else{
            filtreliUrunler = yemekListesi.filter { yemekler in
                yemekler.yemek_adi!.lowercased().contains(searchText.lowercased())
                
            }
        }
        anasayfaTableview.reloadData()
    }
    
}



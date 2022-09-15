//
//  LoginVC.swift
//  GastroApp
//
//  Created by Asilcan Çetinkaya on 11.09.2022.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var appLabel: UILabel!
    @IBOutlet weak var sifreTxf: UITextField!
    @IBOutlet weak var kullaniciAdiTxf: UITextField!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        
    }

    @IBAction func girisYapButon(_ sender: Any) {
        performSegue(withIdentifier: "toAnasayfa", sender: nil)
        
    }
    
    @IBAction func forgetPassword(_ sender: Any) {
    }
    
}

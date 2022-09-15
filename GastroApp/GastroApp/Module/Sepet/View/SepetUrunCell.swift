//
//  SepetUrunCell.swift
//  GastroApp
//
//  Created by Asilcan Çetinkaya on 12.09.2022.
//

import UIKit

class SepetUrunCell: UITableViewCell {

    @IBOutlet weak var adetToplam: UILabel!
    @IBOutlet weak var sepetUrunFiyat: UILabel!
    @IBOutlet weak var sepetUrunAdet: UILabel!
    @IBOutlet weak var sepetUrunAd: UILabel!
    @IBOutlet weak var sepetUrunImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}

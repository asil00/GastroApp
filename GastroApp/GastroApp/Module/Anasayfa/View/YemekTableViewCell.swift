//
//  YemekTableViewCell.swift
//  GastroApp
//
//  Created by Asilcan Çetinkaya on 12.09.2022.
//

import UIKit

class YemekTableViewCell: UITableViewCell {

    @IBOutlet weak var urunFiyatLabel: UILabel!
    @IBOutlet weak var urunAdiLabel: UILabel!
    @IBOutlet weak var yemekImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

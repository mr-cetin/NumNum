//
//  SepetHucre.swift
//  NumNum
//
//  Created by EMRE on 23.09.2022.
//

import UIKit

class SepetHucre : UITableViewCell {
    
    @IBOutlet weak var yemekResim: UIImageView!
    @IBOutlet weak var yemekAdLabel: UILabel!
    @IBOutlet weak var yemekFiyatLabel: UILabel!
    @IBOutlet weak var yemekMiktarLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

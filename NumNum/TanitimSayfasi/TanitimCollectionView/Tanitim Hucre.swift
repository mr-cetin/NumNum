//
//  Tanitim Hucre.swift
//  NumNum
//
//  Created by EMRE on 21.09.2022.
//

import UIKit

class tanitimHucre: UICollectionViewCell {
    
    static let identifier = String(describing: tanitimHucre.self)
    @IBOutlet weak var tanitimLabel:UILabel!
    @IBOutlet weak var tanitimImageView:UIImageView!
    
    func duzenle(_ slide: tanitimSlide) {
        tanitimImageView.image = slide.image
        tanitimLabel.text = slide.aciklama
    }

}

//
//  KayitEkrani.swift
//  NumNum
//
//  Created by EMRE on 22.09.2022.
//

import UIKit
import Firebase


class KayitEkrani: UIViewController {
    
    @IBOutlet weak var epostaTf : UITextField!
    @IBOutlet weak var sifreTf : UITextField!
    var kayitPresenterObjesi: ViewToPresenterKayitEkraniProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        KayitEkraniRouter.createModule(ref: self)
    }
    @IBAction func kaydolButton(_sender: Any) {
        if let eposta = epostaTf.text,
           let sifre = sifreTf.text{
            kayitPresenterObjesi?.kayitYap(eposta: eposta, sifre: sifre)
        }
    }
}

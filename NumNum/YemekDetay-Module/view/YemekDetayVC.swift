//
//  YemekDetayVC.swift
//  NumNum
//
//  Created by EMRE on 23.09.2022.
//

import UIKit
import Firebase
import Kingfisher

class YemekDetayVC: UIViewController {
    
    @IBOutlet weak var yemekAdLabel: UILabel!
    @IBOutlet weak var yemekResim: UIImageView!
    @IBOutlet weak var miktarLabel: UILabel!
    @IBOutlet weak var toplamFiyat: UILabel!
    
    var yemekDetayPresenterObjesi: ViewToPresenterYemekDetayProtocol?
    var miktar : Int = 0
    var yemek : Yemekler?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        YemekDetayRouter.createModule(ref: self)

        if let y = yemek{
            yemekAdLabel.text = y.yemek_adi
            toplamFiyat.text = ("\(y.yemek_fiyat!) ₺")
            if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(y.yemek_resim_adi!)") {
                DispatchQueue.main.async {
                    self.yemekResim.kf.setImage(with : url)
                }
            }
        }
    }
    
    func sepeteEkle(){
        if miktar >= 1 && miktar > 20{
            miktar += 1
        }
        miktarLabel.text = "\(miktar)"
        if let y = yemek {
            let sepetToplami = Int(y.yemek_fiyat!)
            toplamFiyat.text = "\(sepetToplami! * miktar) ₺"
        }
    }
    func sepettenCikar(){
        if miktar > 1 && miktar <= 20 {
            miktar -= 1
        }
        miktarLabel.text = "\(miktar)"
        if let y = yemek {
            let sepetToplami = Int(y.yemek_fiyat!)
            toplamFiyat.text = "\(sepetToplami! * miktar) ₺"
        }
    }

    @IBAction func cikarButton(_ sender: Any) {
        sepettenCikar()
    }
    @IBAction func ekleButton(_ sender: Any) {
        sepeteEkle()
    }
    @IBAction func sepeteEkleButton(_ sender: Any) {
        if let y = yemek{
            yemekDetayPresenterObjesi?.yemekleriSepeteEkle(yemek_adi: y.yemek_adi!, yemek_fiyat: y.yemek_fiyat!, yemek_resim_adi: y.yemek_resim_adi!, yemek_siparis_adet: String(miktar), kullanici_adi: "\(Auth.auth().currentUser?.email ?? "")")
            
            let bildirim = UIAlertController(title: "Sepete Ekle", message: "\(y.yemek_adi!) sepete eklendi.", preferredStyle: .alert)
            let tamam = UIAlertAction(title: "Tamam", style: .default) { action in
                self.navigationController?.popToRootViewController(animated: true)
            }
            bildirim.addAction(tamam)
            self.present(bildirim, animated: true)
        }
        
    }
}

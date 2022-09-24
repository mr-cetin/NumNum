//
//  GirisEkrani.swift
//  NumNum
//
//  Created by EMRE on 22.09.2022.
//


import UIKit
import Firebase


class GirisEkrani: UIViewController {
    @IBOutlet weak var epostaTf: UITextField!
    @IBOutlet weak var sifreTf: UITextField!

    var GirisEkraniPresenterNesnesi : ViewToPresenterGirisEkraniProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
     //   GirisEkraniRouter.createModule(ref: self)
    }
    @IBAction func kayitButton(_sender: Any) {
        performSegue(withIdentifier: "toKayit", sender: nil)
    }
    @IBAction func girisButton(_sender: Any) {
        let auth = Auth.auth()
        if let eposta = epostaTf.text,
           let sifre = sifreTf.text {
            GirisEkraniPresenterNesnesi?.giris(eposta: eposta, sifre: sifre)
        }
        auth.addStateDidChangeListener() { (auth, kullanici) in
            if kullanici != nil {
                print("Başarıyla giriş yapıldı")
                self.performSegue(withIdentifier: "Anasayfa", sender: nil)
            }else {
                let hata = UIAlertController(title: "Hata", message: "E-posta yada şifre hatalı", preferredStyle: .alert)
                let tamam = UIAlertAction(title: "Tamam", style: .default){ action in
                    self.navigationController?.popToRootViewController(animated: true)}
                hata.addAction(tamam)
                self.present(hata, animated: true)
            }
        }
}
}

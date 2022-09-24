//
//  SepetVC.swift
//  NumNum
//
//  Created by EMRE on 23.09.2022.
//

import UIKit
import Firebase
import Alamofire
import Kingfisher


class SepetVC: UIViewController {

    @IBOutlet weak var sepetTableView: UITableView!
    @IBOutlet weak var toplamTutarLabel: UILabel!
    var sepetPresenterObjesi : ViewToPresenterSepetProtocol?
    var sepettekiYemekler = [YemekDetay]()
    var yemekMiktari = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SepetRouter.createModule(ref: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        sepetPresenterObjesi?.tumSepetiGetir()
        sepetPresenterObjesi?.miktariDüzenle()
    }
    @IBAction func siparisButton(_ sender: Any) {
        performSegue(withIdentifier: "toHarita", sender: nil)
    }
    @IBAction func sepetiBosalt(_ sender: Any) {
        self.sepetPresenterObjesi?.tumunuSil(tumYemekler: sepettekiYemekler)
        self.sepetTableView.reloadData()
        self.sepetTableView.dataSource = nil
        toplamTutarLabel.text = "0"
    }
}
extension SepetVC : UITableViewDelegate,UITableViewDataSource {
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sepettekiYemekler.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let sepettekiler = sepettekiYemekler[indexPath.row]
    let hucre = tableView.dequeueReusableCell(withIdentifier: "SepetHucre", for: indexPath) as! SepetHucre
    hucre.yemekAdLabel.text = sepettekiler.yemek_adi!
    hucre.yemekFiyatLabel.text = "\(Int(sepettekiler.yemek_fiyat!)!) ₺"
    hucre.yemekMiktarLabel.text = "\(sepettekiler.yemek_siparis_adet!) adet"
    if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(sepettekiler.yemek_resim_adi!)") {
        DispatchQueue.main.async {
            hucre.yemekResim.kf.setImage(with: url)
        }
    }
    return hucre
}
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { (contextualAction,view,bool) in
            let sepet = self.sepettekiYemekler[indexPath.row]
                self.sepettekiYemekler.remove(at: indexPath.row)
                self.sepetPresenterObjesi?.sil(tekYemek: sepet, kullanici_adi: "\(Auth.auth().currentUser?.email ?? "")")
                tableView.reloadData()
                  self.yemekMiktari -= 1
                    if self.yemekMiktari == 0 {
                        self.toplamTutarLabel.text = "0"
                   }
                    print(self.yemekMiktari)
                }
                return UISwipeActionsConfiguration(actions: [silAction])
            }
}
extension SepetVC : PresenterToViewSepetProtocol {
    func viewaVeriGonder(sepetListesi: Array<YemekDetay>) {
        self.sepettekiYemekler = sepetListesi
        DispatchQueue.main.async {
            self.sepetTableView.reloadData()
            var toplam = 0
            self.sepettekiYemekler.forEach { sepetYemek in
                toplam = toplam + (Int(sepetYemek.yemek_fiyat ?? "0")! * Int(sepetYemek.yemek_siparis_adet ?? "0")!)
            }
            self.toplamTutarLabel.text = "\(toplam) ₺"
        }
    }
    func viewaVeriGonder(yemekMiktari: Int) {
        self.yemekMiktari = yemekMiktari
        DispatchQueue.main.async {
            self .sepetTableView.reloadData()
        }
    }
}

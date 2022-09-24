//
//  AnasayfaVC.swift
//  NumNum
//
//  Created by EMRE on 23.09.2022.
//

import UIKit
import Alamofire
import Kingfisher
import Firebase

class AnasayfaVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var yemeklerCollectionView: UICollectionView!
    
    var anasayfaPresenterObjesi : ViewToPresenterAnasayfaProtocol?
    var yemekListesi = [Yemekler]()
    var filtrele = [Yemekler]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        yemeklerCollectionView.delegate = self
        yemeklerCollectionView.dataSource = self
        searchBar.delegate = self
        AnasayfaRouter.createModule(ref: self)
        
        self.searchBar.isTranslucent = true
        searchBar.barTintColor = UIColor.clear
        searchBar.backgroundColor = UIColor.clear
        self.tabBarController?.navigationItem.titleView = searchBar
        
        let dizayn = UICollectionViewFlowLayout()
        dizayn.minimumLineSpacing = 10
        dizayn.minimumInteritemSpacing = 10
        dizayn.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        let genislik = yemeklerCollectionView.frame.size.width
        let hucreGenislik = (genislik - 30) / 2
        dizayn.itemSize = CGSize(width: hucreGenislik, height: hucreGenislik*1.5)
        yemeklerCollectionView.collectionViewLayout = dizayn
    }
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterObjesi?.yemekleriGetir()
        anasayfaPresenterObjesi?.sepetiGetir()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "YemekDetay" {
            let yemek = sender as? Yemekler
            let gidilecekVC = segue.destination as! YemekDetayVC
            gidilecekVC.yemek = yemek
        }
    }
    
}
extension AnasayfaVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filtrele.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let yemek = filtrele[indexPath.row]
        let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "YemekHucre", for: indexPath) as! YemekHucre
        let rgb: CGColorSpace = CGColorSpaceCreateDeviceRGB()
        let black: [CGFloat]   = [0.0, 0.0, 0.0, 0.8]
        hucre.layer.shadowColor = CGColor(colorSpace: rgb, components: black)
        hucre.layer.shadowOpacity = 0.08;
        hucre.layer.shadowRadius = 10;
        hucre.yemekAdi.text = yemek.yemek_adi!
        hucre.yemekFiyati.text = "\(yemek.yemek_fiyat!).00 ₺"

        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)")
                {
                    DispatchQueue.main.async {
                        hucre.yemekResim.kf.setImage(with : url)
                    }
                }
        return hucre
    }

  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let yemek = filtrele[indexPath.row]
        performSegue(withIdentifier: "YemekDetay", sender: yemek)
    }

    }
extension AnasayfaVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filtrele = self.yemekListesi.filter { filter in
            if filter.yemek_adi!.lowercased().contains(searchText.lowercased()) {
                return true
            }
            if searchText.isEmpty {
                return true
            }
            return false
        }
        self.yemeklerCollectionView.reloadData()
    }
}
extension AnasayfaVC : PresenterToViewAnasayfaProtocol {
    func ViewaVeriGonder(sepettekiYemekler: Int) {
    }
    
    func ViewaVeriGonder(yemekler: Array<Yemekler>) {
        self.yemekListesi = yemekler
        self.filtrele = yemekler
        DispatchQueue.main.async {
            self.yemeklerCollectionView.reloadData()
        }
    
    }
    
}


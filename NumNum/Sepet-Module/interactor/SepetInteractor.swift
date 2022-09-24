//
//  SepetInteractor.swift
//  NumNum
//
//  Created by EMRE on 24.09.2022.
//

import Foundation
import Alamofire
import Firebase

class SepetInteractor : PresenterToInteractorSepetProtocol {
    var sepetPresenter: InteractorToPresenterSepetProtocol?
    
    func sepetiGetir() {
        func getCart() {
            let param : Parameters = ["kullanici_adi" : "\(Auth.auth().currentUser?.email ?? "")"]
                    AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: param).response { response in
                        if let data = response.data {
                            do {
                                let cevap = try JSONDecoder().decode(YemeklerDetayCevap.self, from: data)
                                var liste = [YemekDetay]()
                                if let cevapListesi = cevap.sepet_yemekler {
                                    liste = cevapListesi
                                }
                                self.sepetPresenter?.presenteraVeriGonder(sepetListesi: liste)
                            } catch  {
                                print(error.localizedDescription)
                            }
                        }
                    }
                }
    }
    
    func urunSil(tekYemek: YemekDetay, kullanici_adi: String) {
        let param : Parameters = [
            "sepet_yemek_id" : tekYemek.sepet_yemek_id!,
            "kullanici_adi" : Auth.auth().currentUser?.email ?? ""]
                AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php", method: .post, parameters: param).response{ response in
                    if let data = response.data {
                        do{
                            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                                print(json)
                                self.sepetiGetir()
                                }
                        }catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
    
    func tumunuSil(tumYemekler: Array<YemekDetay>) {
        for urun in tumYemekler{
            DispatchQueue.main.async {[weak self] in
                self?.urunSil(tekYemek: urun, kullanici_adi: Auth.auth().currentUser?.email ?? "")
            }
        }
    }
    
    func miktariDuzenle() {
            let param : Parameters = ["kullanici_adi" : "\(Auth.auth().currentUser?.email ?? "")"]
                    AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: param).response{ response in
                        if let data = response.data {
                            do {
                                let cevap = try JSONDecoder().decode(YemeklerDetayCevap.self, from: data)
                                var liste = [YemekDetay]()
                                if let cevapListesi = cevap.sepet_yemekler {
                                    liste = cevapListesi
                                }
                                print(liste)
                                self.sepetPresenter?.presenteraVeriGonder(yemekMiktari: liste.count)
                            } catch  {
                                print(error.localizedDescription)
                            }
                        }
                    }
        }
    }
    
    


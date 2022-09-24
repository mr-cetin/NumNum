//
//  AnasayfaInteractor.swift
//  NumNum
//
//  Created by EMRE on 23.09.2022.
//

import Foundation
import Alamofire
import Firebase

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    func tümYemekleriGetir() {
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method:.get).response { response in
                    if let data = response.data {
                        do {
                            let cevap = try JSONDecoder().decode(YemeklerCevap.self, from: data)
                            var liste = [Yemekler]()
                            if let cevapListesi = cevap.yemekler {
                                liste = cevapListesi
                            }
                            self.anasayfaPresenter?.PresenteraVeriGonder(yemekler: liste)
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
    
    func sepetiGetir() {
        let param : Parameters = ["kullanici_adi" : "\(Auth.auth().currentUser?.email ?? "")"]
               AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: param).response { response in
                   
                   if let data = response.data {
                       do {
                           let cevap = try JSONDecoder().decode(YemeklerDetayCevap.self, from: data)
                           var liste = [YemekDetay]()
                           if let cevapListesi = cevap.sepet_yemekler {
                               liste = cevapListesi
                           }
                           print(liste)
                           self.anasayfaPresenter?.PresenteraVeriGonder(sepettekiYemekler: liste.count)
                       } catch  {
                           print(error.localizedDescription)
                       }
                   }
               }
           }
    
 
}

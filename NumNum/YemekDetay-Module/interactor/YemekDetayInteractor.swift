//
//  YemekDetayInteractor.swift
//  NumNum
//
//  Created by EMRE on 23.09.2022.
//

import Foundation
import Firebase
import Alamofire

class YemekDetayInteractor : PresenterToInteractorYemekDetayProtocol {
func sepeteEkle(yemek_adi: String, yemek_fiyat: String, yemek_resim_adi: String, yemek_siparis_adet: String, kullanici_adi: String) {
    let params : Parameters = ["yemek_adi" : yemek_adi, "yemek_fiyat" : yemek_fiyat, "yemek_siparis_adet" : yemek_siparis_adet, "yemek_resim_adi" : yemek_resim_adi, "kullanici_adi" : "\(Auth.auth().currentUser?.email ?? "")"]
    AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php", method: .post, parameters : params).response{
                response in
                if let data = response.data {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                            print(json)
                        }
                    } catch  {
                        print(error.localizedDescription)
                    }
                }
            }
        }
}


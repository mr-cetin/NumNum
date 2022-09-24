//
//  YemekDetayPresenter.swift
//  NumNum
//
//  Created by EMRE on 23.09.2022.
//

import Foundation

class YemekDetayPresenter: ViewToPresenterYemekDetayProtocol {
    var yemekDetayInteractor: PresenterToInteractorYemekDetayProtocol?
    
    func yemekleriSepeteEkle(yemek_adi: String, yemek_fiyat: String, yemek_resim_adi: String, yemek_siparis_adet: String, kullanici_adi: String) {
        yemekDetayInteractor?.sepeteEkle(yemek_adi: yemek_adi, yemek_fiyat: yemek_fiyat, yemek_resim_adi: yemek_resim_adi, yemek_siparis_adet: yemek_siparis_adet, kullanici_adi: kullanici_adi)
    }
}

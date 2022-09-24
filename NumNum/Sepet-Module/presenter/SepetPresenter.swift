//
//  SepetPresenter.swift
//  NumNum
//
//  Created by EMRE on 24.09.2022.
//

import Foundation

class SepetPresenter : ViewToPresenterSepetProtocol {
    var sepetView: PresenterToViewSepetProtocol?
    var SepetInteractor: PresenterToInteractorSepetProtocol?
   
    func tumSepetiGetir() {
        SepetInteractor?.sepetiGetir()
    }
    
    func `sil`(tekYemek: YemekDetay, kullanici_adi: String) {
        SepetInteractor?.urunSil(tekYemek: tekYemek, kullanici_adi: kullanici_adi)
    }
    
    func tumunuSil(tumYemekler: Array<YemekDetay>) {
        SepetInteractor?.tumunuSil(tumYemekler: tumYemekler)
    }
    
    func miktariDüzenle() {
        SepetInteractor?.miktariDuzenle()
    }
}
extension SepetPresenter : InteractorToPresenterSepetProtocol {
    
    func presenteraVeriGonder(sepetListesi: Array<YemekDetay>) {
    sepetView?.viewaVeriGonder(sepetListesi: sepetListesi)
}
    func presenteraVeriGonder(yemekMiktari: Int) {
    sepetView?.viewaVeriGonder(yemekMiktari: yemekMiktari)
    }
}

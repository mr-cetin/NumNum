//
//  SepetProtocols.swift
//  NumNum
//
//  Created by EMRE on 23.09.2022.
//

import Foundation

protocol ViewToPresenterSepetProtocol {
    var SepetInteractor : PresenterToInteractorSepetProtocol? {get set}
    var sepetView : PresenterToViewSepetProtocol? {get set}
    
    func tumSepetiGetir()
    func sil(tekYemek: YemekDetay, kullanici_adi: String)
    func tumunuSil(tumYemekler: Array<YemekDetay>)
    func miktariDüzenle()
}

protocol PresenterToInteractorSepetProtocol {
    var sepetPresenter : InteractorToPresenterSepetProtocol? {get set}
    
    func sepetiGetir()
    func urunSil(tekYemek:YemekDetay,kullanici_adi: String)
    func tumunuSil(tumYemekler: Array<YemekDetay>)
    func miktariDuzenle()
}
protocol InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(sepetListesi: Array<YemekDetay>)
    func presenteraVeriGonder(yemekMiktari : Int)
}
protocol PresenterToViewSepetProtocol {
    func viewaVeriGonder(sepetListesi : Array<YemekDetay>)
    func viewaVeriGonder(yemekMiktari : Int)
}
protocol PresenterToRouterSepetProtocol {
    static func createModule(ref: SepetVC)
}

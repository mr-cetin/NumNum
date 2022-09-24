//
//  YemekDetayProtocols.swift
//  NumNum
//
//  Created by EMRE on 23.09.2022.
//

import Foundation

protocol ViewToPresenterYemekDetayProtocol{
    var yemekDetayInteractor : PresenterToInteractorYemekDetayProtocol? {get set}
    func yemekleriSepeteEkle(
        yemek_adi : String,
        yemek_fiyat : String,
        yemek_resim_adi : String,
        yemek_siparis_adet:String,
        kullanici_adi:String
    )
}
protocol PresenterToInteractorYemekDetayProtocol{
    func sepeteEkle(
        yemek_adi : String,
        yemek_fiyat : String,
        yemek_resim_adi : String,
        yemek_siparis_adet:String,
        kullanici_adi:String
    )
}
protocol PresenterToRouterYemekDetayProtocol{
    static func createModule(ref:YemekDetayVC)
}

//
//  Protocols.swift
//  NumNum
//
//  Created by EMRE on 21.09.2022.
//

import Foundation

//Ana Protokoller
protocol ViewToPresenterGirisEkraniProtocol {
    var girisEkraniInteractor : PresenterToInteractorGirisEkraniProtocol? {get set}
    func giris(eposta: String, sifre:String)
}
protocol PresenterToInteractorGirisEkraniProtocol {
    func gir(eposta: String,sifre: String)
}
//Router
protocol PresenterToRouterGirisEkrani{
    static func createModule(ref: GirisEkrani)
}

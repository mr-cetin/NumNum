//
//  Protocols.swift
//  NumNum
//
//  Created by EMRE on 22.09.2022.
//

import Foundation

protocol ViewToPresenterKayitEkraniProtocol {
    var KayitEkraniInteractor: PresenterToInteractorKayitEkraniProtocol? {get set}
    func kayitYap(eposta: String, sifre: String)
}
protocol PresenterToInteractorKayitEkraniProtocol {
    func kayit(eposta: String, sifre: String)
}
protocol PresenterToRouterKayitEkraniProtocol {
    static func createModule(ref: KayitEkrani)
}

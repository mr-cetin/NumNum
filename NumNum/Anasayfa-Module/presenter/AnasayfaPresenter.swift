//
//  AnasayfaPresenter.swift
//  NumNum
//
//  Created by EMRE on 23.09.2022.
//

import Foundation

class AnasayfaPresenter : ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func yemekleriGetir() {
        anasayfaInteractor?.tümYemekleriGetir()
    }
    
    func sepetiGetir() {
        anasayfaInteractor?.sepetiGetir()
    }
    
}
extension AnasayfaPresenter : InteractorToPresenterAnasayfaProtocol {
    func PresenteraVeriGonder(yemekler: Array<Yemekler>) {
        anasayfaView?.ViewaVeriGonder(yemekler: yemekler)
    }
    
    func PresenteraVeriGonder(sepettekiYemekler: Int) {
        anasayfaView?.ViewaVeriGonder(sepettekiYemekler: sepettekiYemekler)
    }
}

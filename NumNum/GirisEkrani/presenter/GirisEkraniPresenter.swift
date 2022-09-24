//
//  GirisEkraniPresenter.swift
//  NumNum
//
//  Created by EMRE on 22.09.2022.
//

import Foundation

class GirisEkraniPresenter: ViewToPresenterGirisEkraniProtocol {
    var girisEkraniInteractor: PresenterToInteractorGirisEkraniProtocol?
    func giris(eposta: String, sifre: String) {
        girisEkraniInteractor?.gir(eposta: eposta, sifre: sifre)
    }
}

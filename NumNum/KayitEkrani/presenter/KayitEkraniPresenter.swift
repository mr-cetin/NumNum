//
//  KayitEkraniPresenter.swift
//  NumNum
//
//  Created by EMRE on 22.09.2022.
//

import Foundation

class KayitEkraniPresenter : ViewToPresenterKayitEkraniProtocol {
    var KayitEkraniInteractor: PresenterToInteractorKayitEkraniProtocol?
    func kayitYap(eposta: String, sifre: String) {
        KayitEkraniInteractor?.kayit(eposta: eposta, sifre: sifre)
    }
}

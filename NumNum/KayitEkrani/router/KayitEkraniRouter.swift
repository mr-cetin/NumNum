//
//  KayitEkraniRouter.swift
//  NumNum
//
//  Created by EMRE on 22.09.2022.
//

import Foundation

class KayitEkraniRouter: PresenterToRouterKayitEkraniProtocol {
    static func createModule(ref: KayitEkrani) {
        ref .kayitPresenterObjesi = KayitEkraniPresenter()
        ref.kayitPresenterObjesi?.KayitEkraniInteractor = KayitEkraniInteractor()
    }
}

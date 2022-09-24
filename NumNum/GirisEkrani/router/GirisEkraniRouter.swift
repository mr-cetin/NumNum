//
//  GirisEkraniRouter.swift
//  NumNum
//
//  Created by EMRE on 22.09.2022.
//

import Foundation
class GirisEkraniRouter : PresenterToRouterGirisEkrani {
    static func createModule(ref: GirisEkrani) {
        ref.GirisEkraniPresenterNesnesi = GirisEkraniPresenter()
        ref.GirisEkraniPresenterNesnesi?.girisEkraniInteractor = GirisEkraniInteractor()
    }
}

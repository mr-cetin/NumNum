//
//  YemekDetayRouter.swift
//  NumNum
//
//  Created by EMRE on 23.09.2022.
//

import Foundation

class YemekDetayRouter : PresenterToRouterYemekDetayProtocol {
    static func createModule(ref: YemekDetayVC) {
        ref.yemekDetayPresenterObjesi = YemekDetayPresenter()
        ref.yemekDetayPresenterObjesi?.yemekDetayInteractor = YemekDetayInteractor()
    }
}

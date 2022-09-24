//
//  SepetRouter.swift
//  NumNum
//
//  Created by EMRE on 24.09.2022.
//

import Foundation

class SepetRouter : PresenterToRouterSepetProtocol {
    static func createModule(ref: SepetVC) {
        let presenter = SepetPresenter()
        ref.sepetPresenterObjesi = presenter
        ref.sepetPresenterObjesi?.SepetInteractor = SepetInteractor()
        ref.sepetPresenterObjesi?.sepetView = ref 
        ref.sepetPresenterObjesi?.SepetInteractor?.sepetPresenter = presenter
    }
}

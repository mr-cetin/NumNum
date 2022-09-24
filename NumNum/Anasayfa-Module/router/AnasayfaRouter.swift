//
//  AnasayfaRouter.swift
//  NumNum
//
//  Created by EMRE on 23.09.2022.
//

import Foundation

class AnasayfaRouter : PresenterToRouterAnasayfaProtocol {
    static func createModule(ref: AnasayfaVC) {
        let presenter = AnasayfaPresenter()
        
        ref.anasayfaPresenterObjesi = presenter
        ref.anasayfaPresenterObjesi?.AnasayfaInteractor = AnasayfaInteractor()
        ref.anasayfaPresenterObjesi?.anasayfaView = ref
        ref.anasayfaPresenterObjesi?.AnasayfaInteractor?.anasayfaPresenter = presenter        
    }
}

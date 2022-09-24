//
//  Protocols.swift
//  NumNum
//
//  Created by EMRE on 22.09.2022.
//

import Foundation

//Presenter
protocol ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor : PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView : PresenterToViewAnasayfaProtocol? {get set}
    
    func yemekleriGetir()
    func sepetiGetir()
}

//Interactor
protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter : InteractorToPresenterAnasayfaProtocol? {get set}
    
    func tümYemekleriGetir()
    func sepetiGetir()
}
//Presenter
protocol InteractorToPresenterAnasayfaProtocol {
    func PresenteraVeriGonder(yemekler : Array<Yemekler>)
    func PresenteraVeriGonder(sepettekiYemekler : Int)
}
protocol PresenterToViewAnasayfaProtocol {
    func ViewaVeriGonder(yemekler : Array<Yemekler>)
    func ViewaVeriGonder(sepettekiYemekler : Int)
}
//Router
protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref: AnasayfaVC)
}

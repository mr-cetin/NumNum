//
//  GirisEkraniInteractor.swift
//  NumNum
//
//  Created by EMRE on 22.09.2022.
//

import Foundation
import Firebase

class GirisEkraniInteractor : PresenterToInteractorGirisEkraniProtocol {
    func gir(eposta: String, sifre: String) {
        let auth = Auth.auth()
        auth.signIn(withEmail: eposta, password: sifre) { authDurumu, error in}
    }
}

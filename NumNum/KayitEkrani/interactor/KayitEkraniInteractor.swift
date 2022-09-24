//
//  KayitEkraniInteractor.swift
//  NumNum
//
//  Created by EMRE on 22.09.2022.
//

import Foundation
import Firebase

class KayitEkraniInteractor: PresenterToInteractorKayitEkraniProtocol {
    func kayit(eposta: String, sifre: String) {
    let auth = Auth.auth()
    auth.createUser(withEmail: eposta, password: sifre){(authdurumu, error) in
        if let kullanici = authdurumu?.user {
            print(kullanici)
        }else {
            print("Kayıt oluşturulamadı.")
        }
    }
}
}

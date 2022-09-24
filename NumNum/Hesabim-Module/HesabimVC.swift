//
//  HesabimVC.swift
//  NumNum
//
//  Created by EMRE on 24.09.2022.
//

import UIKit
import Firebase

class HesabimVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signOutButton(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toGiriş", sender: nil)
        }catch {
            print(error.localizedDescription)
        }
    }
}

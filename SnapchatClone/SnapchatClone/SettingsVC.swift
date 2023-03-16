//
//  SettingsVC.swift
//  SnapchatClone
//
//  Created by Zeynep Uzunsoy on 13.03.2023.
//

import UIKit
import Firebase

class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logoutClicked(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toSignInVC", sender: nil)
        }
        catch {
            
        }
    }
    
}

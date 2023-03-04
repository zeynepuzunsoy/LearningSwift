//
//  SettingsViewController.swift
//  InstagramClone
//
//  Created by Zeynep Uzunsoy on 1.03.2023.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logoutClicked(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toViewController", sender: nil)
        }
        catch{
            print("error")
        }
    }
    

}

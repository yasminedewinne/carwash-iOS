//
//  ProfileViewController.swift
//  Carwash
//
//  Created by Yasmine  De Winne on 30/08/2020.
//  Copyright © 2020 Yasmine  De Winne. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var logOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOutClicked() {
        UserDefaults.standard.set("", forKey: "token")
        UserDefaults.standard.set("", forKey: "email")
        performSegue(withIdentifier: "SignOut", sender: logOutButton)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

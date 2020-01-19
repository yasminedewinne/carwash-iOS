//
//  LoginViewController.swift
//  Carwash
//
//  Created by Yasmine  De Winne on 18/01/2020.
//  Copyright © 2020 Yasmine  De Winne. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var wachtwoordTextField: UITextField!
    @IBOutlet var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func LogInClicked() {
        
        APIClient.shared.login(Login(email: emailTextField.text!, password: wachtwoordTextField.text!)){
            (statusCode) in
            if statusCode != nil && statusCode != 400{
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "LogIn", sender: self)
                }
            }else{
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Watch out", message: "The email or password is not correct", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
                    
                    self.present(alert, animated: true)
                    self.emailTextField.text = ""
                    self.wachtwoordTextField.text = ""
                }
            }
        }
    }
}

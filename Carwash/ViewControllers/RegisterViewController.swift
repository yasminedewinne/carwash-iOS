//
//  RegisterViewController.swift
//  Carwash
//
//  Created by Yasmine  De Winne on 29/08/2020.
//  Copyright © 2020 Yasmine  De Winne. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet var firstNameTxtField: UITextField!
    @IBOutlet var lastNameTxtField: UITextField!
    @IBOutlet var emailTxtField: UITextField!
    @IBOutlet var phoneTxtField: UITextField!
    @IBOutlet var streetTxtField: UITextField!
    @IBOutlet var houseNrTxtField: UITextField!
    @IBOutlet var cityTxtField: UITextField!
    @IBOutlet var postalCodeTxtField: UITextField!
    @IBOutlet var passwordTxtField: UITextField!
    @IBOutlet var repeatPasswordTxtField: UITextField!
    @IBOutlet var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignUpClicked() {
        
        let adres = Adres(huisNr: phoneTxtField.text!, straatNaam: streetTxtField.text!, postcode: postalCodeTxtField.text!, stad: cityTxtField.text!, land: "België")
        
        let register = Register(voornaam: firstNameTxtField.text!, familienaam: lastNameTxtField.text!, email: emailTxtField.text!, telefoonNr: phoneTxtField.text!, adres: adres, wachtwoord: passwordTxtField.text!, wachtwoordHerhaling: repeatPasswordTxtField.text!)
        
        APIClient.shared.register(register){
            (statusCode) in
            if statusCode != nil && statusCode != 400{
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "SignUp", sender: self)
                }
            }else{
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Watch out", message: "Something went wrong", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
                    
                    self.present(alert, animated: true)
                    self.passwordTxtField.text = ""
                    self.repeatPasswordTxtField.text = ""
                }
            }
        }
        
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

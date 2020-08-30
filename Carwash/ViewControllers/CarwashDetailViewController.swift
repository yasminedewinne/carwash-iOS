//
//  CarwashDetailViewController.swift
//  Carwash
//
//  Created by Yasmine  De Winne on 19/01/2020.
//  Copyright © 2020 Yasmine  De Winne. All rights reserved.
//

import UIKit

class CarwashDetailViewController: UIViewController {

    var carwash: Carwash!
    
    @IBOutlet var autoLabel: UILabel!
    @IBOutlet var datumEnUurLabel: UILabel!
    @IBOutlet var stadLabel: UILabel!
    @IBOutlet var tariefLabel: UILabel!
    @IBOutlet var uitlegLabel: UILabel!
    @IBOutlet var afspraakButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        autoLabel.text = carwash.auto!.merk + " " + carwash.auto!.naam
        datumEnUurLabel.text = carwash.datumEnUur
        stadLabel.text = "Regio " + carwash.gebruiker!.adres.stad
        tariefLabel.text = "€ " + String(carwash.tarief)
        uitlegLabel.text = carwash.takenlijst
    }
    
    @IBAction func afspraakButtonClicked() {
        
        let afspraak = Afspraak(id: 0, gebruikerId: 0, carwashId: carwash.id)
        APIClient.shared.postAfspraak(afspraak: afspraak)
        
        let alert = UIAlertController(title: "New appointment", message: "Go to My Appointments to see this new appointment.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        
        self.present(alert, animated: true)
        
    }
    
    
}

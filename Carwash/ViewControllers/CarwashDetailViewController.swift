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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        autoLabel.text = carwash.auto
        datumEnUurLabel.text = carwash.datumEnUur
        stadLabel.text = carwash.stad
        tariefLabel.text = "€ " + String(carwash.tarief)
        uitlegLabel.text = carwash.takenUitleg
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

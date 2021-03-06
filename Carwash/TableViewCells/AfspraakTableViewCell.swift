//
//  AfspraakTableViewCell.swift
//  Carwash
//
//  Created by Yasmine  De Winne on 19/01/2020.
//  Copyright © 2020 Yasmine  De Winne. All rights reserved.
//

import UIKit

class AfspraakTableViewCell: UITableViewCell {

    @IBOutlet var autoLabel: UILabel!
    @IBOutlet var datumEnUurLabel: UILabel!
    @IBOutlet var stadLabel: UILabel!
    @IBOutlet var tariefLabel: UILabel!
    @IBOutlet var uitlegLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update(with afspraak: Afspraak){
        autoLabel.text = (afspraak.carwash?.auto!.merk ?? "Niet gevonden") + " " + (afspraak.carwash?.auto!.naam ?? "")
        datumEnUurLabel.text = afspraak.carwash!.datumEnUur
        stadLabel.text = "Regio " + (afspraak.carwash?.gebruiker!.adres.stad ?? "Niet gevonden")
        tariefLabel.text = "€ " + String(afspraak.carwash!.tarief)
        uitlegLabel.text = afspraak.carwash!.takenlijst
    }

}

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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update(with afspraak: Afspraak){
        autoLabel.text = afspraak.carwash.auto
        datumEnUurLabel.text = afspraak.carwash.datumEnUur
        stadLabel.text = afspraak.carwash.stad
        tariefLabel.text = "€ " + String(afspraak.carwash.tarief)
        uitlegLabel.text = afspraak.carwash.takenUitleg
    }

}

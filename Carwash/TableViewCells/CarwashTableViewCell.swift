//
//  CarwashTableViewCell.swift
//  Carwash
//
//  Created by Yasmine  De Winne on 19/01/2020.
//  Copyright © 2020 Yasmine  De Winne. All rights reserved.
//

import UIKit

class CarwashTableViewCell: UITableViewCell {

    
    @IBOutlet var autoLabel: UILabel!
    @IBOutlet var datumLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func update(with carwash: Carwash){
        autoLabel.text = carwash.auto.merk + " " + carwash.auto.naam
        datumLabel.text = carwash.datumEnUur
    }
}

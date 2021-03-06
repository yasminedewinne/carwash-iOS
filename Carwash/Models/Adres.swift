//
//  Adres.swift
//  Carwash
//
//  Created by Yasmine  De Winne on 25/01/2020.
//  Copyright © 2020 Yasmine  De Winne. All rights reserved.
//

import Foundation

struct Adres: Codable {
    var huisNr: String
    var straatNaam: String
    var postcode: String
    var stad: String
    var land: String
    
    enum CodingKeys: String, CodingKey{
        case huisNr
        case straatNaam
        case postcode
        case stad
        case land
    }
    
    init(huisNr: String, straatNaam: String, postcode: String, stad: String, land: String) {
        self.huisNr = huisNr
        self.straatNaam = straatNaam
        self.postcode = postcode
        self.stad = stad
        self.land = land
    }
}

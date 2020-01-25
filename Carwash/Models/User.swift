//
//  User.swift
//  Carwash
//
//  Created by Yasmine  De Winne on 25/01/2020.
//  Copyright © 2020 Yasmine  De Winne. All rights reserved.
//

import Foundation

struct User: Codable {
    var voornaam: String
    var familienaam: String
    var email: String
    var telefoonNr: String
    var adres: Adres
    
    enum CodingKeys: String, CodingKey{
        case voornaam
        case familienaam
        case email
        case telefoonNr
        case adres
    }
}

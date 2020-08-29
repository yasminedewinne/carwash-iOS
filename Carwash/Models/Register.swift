//
//  Register.swift
//  Carwash
//
//  Created by Yasmine  De Winne on 29/08/2020.
//  Copyright © 2020 Yasmine  De Winne. All rights reserved.
//

import Foundation

struct Register: Codable {
    
    var voornaam: String
    var familienaam: String
    var email: String
    var telefoonNr: String
    var adres: Adres
    var wachtwoord: String
    var wachtwoordHerhaling: String
    
    enum CodingKeys: String, CodingKey {
        case voornaam
        case familienaam
        case email
        case telefoonNr
        case adres
        case wachtwoord
        case wachtwoordHerhaling
    }
    
    init(voornaam: String, familienaam: String, email: String, telefoonNr: String, adres: Adres, wachtwoord: String, wachtwoordHerhaling: String) {
        self.voornaam = voornaam
        self.familienaam = familienaam
        self.email = email
        self.telefoonNr = telefoonNr
        self.adres = adres
        self.wachtwoord = wachtwoord
        self.wachtwoordHerhaling = wachtwoordHerhaling
    }
}

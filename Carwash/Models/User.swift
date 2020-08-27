//
//  User.swift
//  Carwash
//
//  Created by Yasmine  De Winne on 25/01/2020.
//  Copyright © 2020 Yasmine  De Winne. All rights reserved.
//

import Foundation

struct User: Codable {
    var id: Int
    var voornaam: String
    var familienaam: String
    var email: String
    var phoneNumber: String
    var adres: Adres
    
    enum CodingKeys: String, CodingKey{
        case id
        case voornaam
        case familienaam
        case email
        case phoneNumber
        case adres
    }
}

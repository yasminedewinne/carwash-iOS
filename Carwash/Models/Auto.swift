//
//  Auto.swift
//  Carwash
//
//  Created by Yasmine  De Winne on 27/08/2020.
//  Copyright © 2020 Yasmine  De Winne. All rights reserved.
//

import Foundation

struct Auto: Codable{
    var id: Int
    var merk: String
    var naam: String
    var gebruikerId: Int
    //var gebruiker: User
    
    enum CodingKeys: String, CodingKey{
        case id
        case merk
        case naam
        case gebruikerId
        //case gebruiker
    }
    
    /*init(id: Int, merk: String, naam: String, gebruikerId: Int) {
        self.id = id
        self.merk = merk
        self.naam = naam
        self.gebruikerId = gebruikerId
    }*/
}

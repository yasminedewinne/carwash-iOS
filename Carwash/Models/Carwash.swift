//
//  Carwash.swift
//  Carwash
//
//  Created by Yasmine  De Winne on 17/01/2020.
//  Copyright © 2020 Yasmine  De Winne. All rights reserved.
//

import Foundation

struct Carwash: Codable{
    var id: Int
    var tarief: Int
    var takenlijst: String
    var datumEnUur: String
    var gebruikerId: Int
    var gebruiker: User?
    var autoId: Int
    var auto: Auto?
    
    enum CodingKeys: String, CodingKey{
        case id
        case tarief
        case takenlijst
        case datumEnUur
        case gebruikerId
        case gebruiker
        case auto
        case autoId
        
    }
    
    init(id: Int, tarief: Int, uitleg: String, datumEnUur: String, gebruikerId: Int, autoId: Int) {
        self.id = id
        self.tarief = tarief
        self.takenlijst = uitleg
        self.datumEnUur = datumEnUur
        self.gebruikerId = gebruikerId
        self.autoId = autoId
    }
}

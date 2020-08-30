//
//  Afspraak.swift
//  Carwash
//
//  Created by Yasmine  De Winne on 19/01/2020.
//  Copyright © 2020 Yasmine  De Winne. All rights reserved.
//

import Foundation

struct Afspraak: Codable {
    var id: Int
    var gebruikerId: Int
    var gebruiker: User?
    var carwashId: Int
    var carwash: Carwash?
    
    enum CodingKeys: String, CodingKey{
        case id
        case gebruikerId
        case gebruiker
        case carwashId
        case carwash
    }
    
    init(id: Int, gebruikerId: Int, carwashId: Int) {
        self.id = id
        self.carwashId = carwashId
        self.gebruikerId = gebruikerId
    }
}

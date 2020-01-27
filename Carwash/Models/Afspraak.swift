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
    var carwashId: Int
    var carwash: Carwash
    
    enum CodingKeys: String, CodingKey{
        case id
        case gebruikerId
        case carwashId
        case carwash
    }
    
    init(id: Int, carwash: Carwash, carwashId: Int, gebruikerId: Int) {
        self.id = id
        self.carwash = carwash
        self.carwashId = carwashId
        self.gebruikerId = gebruikerId
    }
}

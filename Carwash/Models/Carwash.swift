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
    var aanbiederId: Int
    var auto: String
    var tarief: Double
    var uitleg: String
    var datumEnUur: Date
    
    enum CodingKeys: String, CodingKey{
        case id
        case aanbiederId
        case auto
        case tarief
        case uitleg
        case datumEnUur
    }
    
    init(id: Int, aanbiederId: Int, auto: String, tarief: Double, uitleg: String, datumEnUur: Date) {
        self.id = id
        self.aanbiederId = aanbiederId
        self.auto = auto
        self.tarief = tarief
        self.uitleg = uitleg
        self.datumEnUur = datumEnUur
    }
}

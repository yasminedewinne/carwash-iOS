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
    var aanbieder: User
    var auto: String
    var tarief: Double
    var takenUitleg: String
    var datumEnUur: Date
    
    enum CodingKeys: String, CodingKey{
        case id
        case aanbiederId
        case aanbieder
        case auto
        case tarief
        case takenUitleg
        case datumEnUur
    }
    
    init(id: Int, aanbiederId: Int, aanbieder: User,auto: String, tarief: Double, uitleg: String, datumEnUur: Date) {
        self.id = id
        self.aanbiederId = aanbiederId
        self.aanbieder = aanbieder
        self.auto = auto
        self.tarief = tarief
        self.takenUitleg = uitleg
        self.datumEnUur = datumEnUur
    }
}

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
    var auto: String
    var stad: String
    var tarief: Int
    var takenUitleg: String
    //var datumEnUur: NSDate
    
    enum CodingKeys: String, CodingKey{
        case id
        case auto
        case stad
        case tarief
        case takenUitleg
        //case datumEnUur
    }
    
    init(id: Int,auto: String, stad: String, tarief: Int, uitleg: String) {
        self.id = id
        self.auto = auto
        self.stad = stad
        self.tarief = tarief
        self.takenUitleg = uitleg
        //self.datumEnUur = datumEnUur
    }
}

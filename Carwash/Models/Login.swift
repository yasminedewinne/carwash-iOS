//
//  Login.swift
//  Carwash
//
//  Created by Yasmine  De Winne on 18/01/2020.
//  Copyright © 2020 Yasmine  De Winne. All rights reserved.
//

import Foundation

struct Login: Codable {
    var email: String
    var password:  String
    
    enum CodingKeys: String, CodingKey {
        case email
        case password
    }
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}

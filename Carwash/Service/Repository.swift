//
//  Repository.swift
//  Carwash
//
//  Created by Yasmine  De Winne on 19/01/2020.
//  Copyright © 2020 Yasmine  De Winne. All rights reserved.
//

import Foundation

class Repository{
    static let shared = Repository()
    let propertyListDecoder = PropertyListDecoder()
    let propertyListEncoder = PropertyListEncoder()
    
    //URL's
    let carwashesArchiveUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("carwashes").appendingPathExtension("plist")
    
    //Write and read
    func writeCarwashesToFile(carwashes: Array<Carwash>) {
       let encodedCarwashes = try? propertyListEncoder.encode(carwashes)
        try? encodedCarwashes?.write(to: carwashesArchiveUrl, options: .noFileProtection)
    }
    
    func readCarwashesFromFile() -> Array<Carwash> {
        if let retrievedCarwashes = try? Data(contentsOf: carwashesArchiveUrl), let decodedCarwashes =  try? propertyListDecoder.decode(Array<Carwash>.self, from: retrievedCarwashes){
                   return decodedCarwashes
               }
               return Array<Carwash>()
    }
}

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
    
    let afsprakenArchiveUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("afsprakengebruiker").appendingPathExtension("plist")
    
    let autosArchiveUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("autosgebruiker").appendingPathExtension("plist")
    
    //Write and read all carwashes
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
    
    //Write and read all afspraken
    func writeAfsprakenToFile(afspraken: Array<Afspraak>) {
        let encodedAfspraken = try? propertyListEncoder.encode(afspraken)
        try? encodedAfspraken?.write(to: afsprakenArchiveUrl, options: .noFileProtection)
    }
    
    func readAfsprakenFromFile() -> Array<Afspraak>{
        if let retrievedAfspraken = try? Data(contentsOf: afsprakenArchiveUrl),
            let decodedAfspraken = try? propertyListDecoder.decode(Array<Afspraak>.self, from: retrievedAfspraken){
            return decodedAfspraken
        }
        return Array<Afspraak>()
    }
    
    //Write and read all autos van gebruiker
    func writeAutosToFile(autos: Array<Auto>) {
        let encodedAutos = try? propertyListEncoder.encode(autos)
        try? encodedAutos?.write(to: autosArchiveUrl, options: .noFileProtection)
    }
    
    func readAutosFromFile() -> Array<Auto>{
        if let retrievedAutos = try? Data(contentsOf: autosArchiveUrl),
            let decodedAutos = try? propertyListDecoder.decode(Array<Auto>.self, from: retrievedAutos){
            return decodedAutos
        }
        return Array<Auto>()
    }
    
}

//
//  CarwashController.swift
//  Carwash
//
//  Created by Yasmine  De Winne on 19/01/2020.
//  Copyright © 2020 Yasmine  De Winne. All rights reserved.
//

import Foundation

class CarwashController{
    static let shared = CarwashController()
    
    func fetchCarwashes(completion: @escaping([Carwash])->Void){
        if(Reachability.isConnected()){
            APIClient.shared.fetchCarwashes{
                (carwashService) in
                if let carwashService = carwashService{
                    Repository.shared.writeCarwashesToFile(carwashes: carwashService)
                    completion(carwashService)
                }
            }
        }else{
            completion(Repository.shared.readCarwashesFromFile())
        }
    }
    
    func fetchAfsprakenGebruiker(completion: @escaping([Afspraak])->Void) {
        if(Reachability.isConnected()){
            APIClient.shared.fetchAfspraken{
                (afsprakenService) in
                if let afsprakenService = afsprakenService{
                    Repository.shared.writeAfsprakenToFile(afspraken: afsprakenService)
                    completion(afsprakenService)
                }
            }
        }else{
            completion(Repository.shared.readAfsprakenFromFile())
        }
    }
    
    func fetchAutosGebruiker(completion: @escaping([Auto])->Void){
        if(Reachability.isConnected()){
            APIClient.shared.fetchAutos{
                (autosService) in
                if let autosService = autosService{
                    Repository.shared.writeAutosToFile(autos: autosService)
                    completion(autosService)
                }
            }
        }else{
            completion(Repository.shared.readAutosFromFile())
        }
    }
}

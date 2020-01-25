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
}

//
//  APIClient.swift
//  Carwash
//
//  Created by Yasmine  De Winne on 18/01/2020.
//  Copyright © 2020 Yasmine  De Winne. All rights reserved.
//

import Foundation

class APIClient{
    
    static let shared = APIClient()
    let baseURL = URL(string: "https://carwashapi.azurewebsites.net/api/")!
    
    func login(_ login: Login, completion: @escaping(Int?)->Void){
        UserDefaults.standard.set("", forKey: "token")
        UserDefaults.standard.set("", forKey: "email")
        let loginUrl = baseURL.appendingPathComponent("auth/login")
        var request = URLRequest(url: loginUrl)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(login)
        let task = URLSession.shared.dataTask(with: request){ (data, response, error) in
            if let error = error{
                print("error: \(error)")
            }else{
                if let response = response as? HTTPURLResponse{
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data, let dataString = String(data: data, encoding: .utf8), let response = response as? HTTPURLResponse{
                    print("data: \(dataString)")
                    UserDefaults.standard.set(dataString, forKey: "token")
                    UserDefaults.standard.set(login.email, forKey: "email")
                    completion(response.statusCode)
                }else{
                    print("nil")
                    completion(nil)
                }
            }
        }
        task.resume()
    }
}


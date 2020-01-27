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
    
    func fetchCarwashes(completion: @escaping ([Carwash]?) -> Void) {
        let carwashURL = baseURL.appendingPathComponent("carwashes")
        var request = URLRequest(url: carwashURL)
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        let bearerToken = "Bearer \(token)"
        request.addValue(bearerToken, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request){
            (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data, let carwashes = try? jsonDecoder.decode([Carwash].self, from: data){
                completion(carwashes)
                print("cars \(carwashes)")
            }else{
                print("nil")
                completion(nil)
            }
        }
        task.resume()
    }
    
    func fetchAfspraken(completion: @escaping ([Afspraak]?)->Void) {
        let email = UserDefaults.standard.string(forKey: "email")
        let userEmail = email!
        let afspraakURL = baseURL.appendingPathComponent("afspraken/gebruiker/\(userEmail)")
        var request = URLRequest(url: afspraakURL)
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        let bearerToken = "Bearer \(token)"
        request.addValue(bearerToken, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request){
            (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data, let afspraken = try? jsonDecoder.decode([Afspraak].self, from: data){
                completion(afspraken)
                print(afspraken)
            }else{
                completion(nil)
            }
        }
        task.resume()
    }
    
    func postCarwash(carwash: Carwash) {
        let postCarwashURL = baseURL.appendingPathComponent("carwashes")
        var request = URLRequest(url: postCarwashURL)
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        let bearerToken = "Bearer \(token)"
        request.addValue(bearerToken, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let data: Carwash = carwash
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(data)
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request){
            (data, respone, error) in
            if let error = error{
                print("error: \(error)")
            }else{
                if let response = respone as? HTTPURLResponse{
                    print(response.statusCode)
                }
            }
        }
        task.resume()
    }
    
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
                if let data = data, let response =  response as? HTTPURLResponse{
                    var dataString = String(decoding: data, as: UTF8.self)
                    dataString.remove(at: dataString.startIndex)
                    dataString = String(dataString.dropLast())
                    
                    UserDefaults.standard.set(dataString, forKey: "token")
                    UserDefaults.standard.set(login.email, forKey: "email")
                    completion(response.statusCode)
                } else {
                    print("nil")
                    completion(nil)
                }
            }
        }
        task.resume()
    }
}


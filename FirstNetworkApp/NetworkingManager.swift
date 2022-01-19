//
//  NetworkingManager.swift
//  FirstNetworkApp
//
//  Created by Vasichko Anna on 14.01.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkingManager {
    static var shared = NetworkingManager()
    private init() {}


    
    func fetchActivity (url: String, completion: @escaping(Result<Activity, NetworkError>) -> Void)  {
         guard let url = URL(string: apiLink) else {
             completion(.failure(.invalidURL))
             return
         }

         URLSession.shared.dataTask(with: url) { data, _, error in
             guard let data = data else {
                 completion(.failure(.noData))
                 print(error?.localizedDescription ?? "No error description")
                 return
             }
             
             do {
                 let activity = try JSONDecoder().decode(Activity.self, from: data)
                 DispatchQueue.main.async {
                     completion(.success(activity))
                 }
             } catch {
                 completion(.failure(.decodingError))
             }
         }.resume()
    }
}

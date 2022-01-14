//
//  NetworkingManager.swift
//  FirstNetworkApp
//
//  Created by Vasichko Anna on 14.01.2022.
//

import Foundation
import UIKit

class NetworkingManager {
    static var shared = NetworkingManager()
    private init() {}


    
    func fetchActivity (url: String, complition: @escaping(_ activity: Activity) -> Void)  {
         guard let url = URL(string: apiLink) else {return}

         URLSession.shared.dataTask(with: url) { data, _, error in
             guard let data = data else {
                 print(error?.localizedDescription ?? "No error description")
                 return
             }

                 guard let activity = try? JSONDecoder().decode(Activity.self, from: data) else {return}
                 DispatchQueue.main.async {
                   complition(activity)
                 }


         }.resume()
     }
}

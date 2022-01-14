//
//  Activity.swift
//  FirstNetworkApp
//
//  Created by Vasichko Anna on 14.01.2022.
//

import Foundation


struct Activity: Decodable {
    let activity: String
    let type: String
    let participants: Int
    let price: Double
}

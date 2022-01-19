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
    
    init(activityData: [String: Any]) {
        activity = activityData["activity"] as? String ?? ""
        type = activityData["type"] as? String ?? ""
        participants = activityData["participants"] as? Int ?? 0
        price = activityData["price"] as? Double ?? 0.0
    }
    
    static func getActivity(from value: Any) -> Activity {
        let activityData = value as? [String: Any] ?? ["": ""]
        let activity = Activity(activityData: activityData)
        return activity
    }
}

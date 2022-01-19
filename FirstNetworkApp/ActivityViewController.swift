//
//  ActivityViewController.swift
//  FirstNetworkApp
//
//  Created by Vasichko Anna on 14.01.2022.
//

import UIKit

let apiLink = "https://www.boredapi.com/api/activity"

class ActivityViewController: UIViewController {

    @IBOutlet weak var detailsLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    @IBOutlet weak var mainImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
 
}

extension ActivityViewController {
    private func setupUI() {
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        NetworkingManager.shared.fetchActivity(url: apiLink) { result in
            switch result {
            case .success(let activity):
                self.activityIndicator.stopAnimating()
                self.detailsLabel.text = """
Activity: \(activity.activity)
Type: \(activity.type)
Participants: \(activity.participants)
Price: \(activity.price)
"""
                switch activity.type {
                case "education":
                    self.mainImage.image = UIImage(named: "education_pic")
                case "recreational":
                    self.mainImage.image = UIImage(named: "recreational_pic")
                case "social":
                    self.mainImage.image = UIImage(named: "social_pic")
                case "diy":
                    self.mainImage.image = UIImage(named: "diy_pic")
                case "charity":
                    self.mainImage.image = UIImage(named: "charity_pic")
                case "cooking":
                    self.mainImage.image = UIImage(named: "cooking_pic")
                case "relaxation":
                    self.mainImage.image = UIImage(named: "relaxation_pic")
                case "music":
                    self.mainImage.image = UIImage(named: "music_pic")
                default:
                    self.mainImage.image = UIImage(named: "busywork_pic")
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
        
    }
    
    private func setupUIWithAlamofire() {
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        NetworkingManager.shared.fetchDataWithAlamofire(apiLink) { result in
            switch result {
            case .success(let activity):
                self.activityIndicator.stopAnimating()
                self.detailsLabel.text = """
Activity: \(activity.activity)
Type: \(activity.type)
Participants: \(activity.participants)
Price: \(activity.price)
"""
            case .failure(let error):
                print(error)
            }
        }
    }
}

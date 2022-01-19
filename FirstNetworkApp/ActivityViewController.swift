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
                self.detailsLabel.text = """
Activity: \(activity.activity)
Type: \(activity.type)
Participants: \(activity.participants)
Price: \(activity.price)
"""
                self.activityIndicator.stopAnimating()
            case .failure(let error):
                print(error)
            }
        }
        
        
    }
}

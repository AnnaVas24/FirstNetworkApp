//
//  ActivityViewController.swift
//  FirstNetworkApp
//
//  Created by Vasichko Anna on 14.01.2022.
//

import UIKit

class ActivityViewController: UIViewController {

    @IBOutlet weak var detailsLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        NetworkingManager.shared.fetchActivity(url: apiLink) { activity in
            self.detailsLabel.text = """
Activity: \(activity.activity)
Type: \(activity.type)
Participants: \(activity.participants)
Price: \(activity.price)
"""
            self.activityIndicator.stopAnimating()
        }
    }
 
}

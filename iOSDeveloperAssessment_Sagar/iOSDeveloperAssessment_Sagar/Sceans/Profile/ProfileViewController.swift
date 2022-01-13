//
//  ProfileViewController.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private var userProfileImageView: UIImageView!
    @IBOutlet private var labelUserName: UILabel!
    
    // MARK: - Variables
    var user: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prepareView()
    }
        
    func prepareView() {
        guard let userDetails = user else { return  }
        title = userDetails.login?.stringValue
        userProfileImageView.loadImageFrom(url: userDetails.avatarURL?.stringValue ?? "")
    }
}

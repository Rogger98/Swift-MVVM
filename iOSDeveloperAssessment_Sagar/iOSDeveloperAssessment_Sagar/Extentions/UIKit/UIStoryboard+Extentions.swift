//
//  UIStoryboard+Extentions.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import UIKit

extension UIStoryboard {
    
    static var followDetailsStoryboard: UIStoryboard {
        return UIStoryboard(name: "FollowDetails", bundle: nil)
    }
    var followingsViewController : FollowingViewController {
        let vcId = String(describing: FollowingViewController.self)
        return (instantiateViewController(withIdentifier: vcId) as? FollowingViewController)!
    }
    var followersViewController : FollowersViewController {
        let vcId = String(describing: FollowersViewController.self)
        return (instantiateViewController(withIdentifier: vcId) as? FollowersViewController)!
    }
}




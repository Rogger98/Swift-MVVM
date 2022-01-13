//
//  UIStoryboard+Extentions.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import UIKit

extension UIStoryboard {
    
    /// follow details storyboard
    static var followDetailsStoryboard: UIStoryboard {
        return UIStoryboard(name: "FollowDetails", bundle: nil)
    }
    
    /// profile storyboard
    static var profileStoryboard: UIStoryboard {
        return UIStoryboard(name: "Profile", bundle: nil)
    }
    
    /// get viewController by it's class name but make sure view controller identifier is provided in storyboard
    func getViewController<T:UIViewController>(_ type: T.Type) -> T {
        let vcId = String(describing: type.self)
        return (instantiateViewController(withIdentifier: vcId) as? T)!
    }
}




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
    static var profileStoryboard: UIStoryboard {
        return UIStoryboard(name: "Profile", bundle: nil)
    }
    
    func getViewController<T:UIViewController>(_ type: T.Type) -> T {
        let vcId = String(describing: type.self)
        return (instantiateViewController(withIdentifier: vcId) as? T)!
    }
}




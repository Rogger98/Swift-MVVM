//
//  GCD.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import Foundation

class GCD {
    
    static func onMain(complition: @escaping() -> Void) {
        DispatchQueue.main.async {
            complition()
        }
    }
}

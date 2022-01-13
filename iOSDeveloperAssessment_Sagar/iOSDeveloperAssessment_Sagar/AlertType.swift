//
//  AlertType.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import Foundation


enum AlertTheam {
    
    case error
    case success
    case custome(String)
    var title: String {
        switch self {
        case .error:
            return "Error"
        case .success:
            return "Success!"
        case .custome(let titleText):
            return titleText
        }
    }
}

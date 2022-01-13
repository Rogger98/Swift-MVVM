//
//  ProfileViewModel.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import Foundation

class ProfileViewModel {
    
 
    func getUserDetails(user: String,complition: @escaping(_ user: UserDetails) -> Void) {
        WebServices.shared.makeRequest(route: .userDetails(userName: user), type: UserDetails.self) { (userAllDetails) in
            complition(userAllDetails)
        } failuer: { (message, responseMessage) in
            
        }

    }
}

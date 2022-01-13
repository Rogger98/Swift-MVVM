//
//  FollowDetailsViewModel.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import Foundation

class FollowDetailsViewModel {
    
    
    var arrayFollows:[Item] = [Item]()
    var didReceivedFollowDetails: (() -> ())?
 
    func getUserFollowdetails(followersUrl: String) {
        
        WebServices.shared.getAPICall(path: followersUrl, type: [Item].self) { (data) in
            self.arrayFollows.append(contentsOf: data)
            self.didReceivedFollowDetails?()
        } failuer: { (error, responseError) in
            print("Error Getting Followers")
        }

    }
}

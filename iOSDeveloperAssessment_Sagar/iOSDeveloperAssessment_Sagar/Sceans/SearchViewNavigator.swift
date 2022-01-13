//
//  SearchViewNavigator.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import UIKit

enum SearchNavigator {
    case moveToFollowing(user: Item)
    case moveToFollowers(user: Item)
}

class SearchViewNavigator {
    
    let controller: SearchViewController
    init(_ viewController: SearchViewController) {
        controller = viewController
    }
    func moveTo(navigator: SearchNavigator) {
        switch navigator {
        case .moveToFollowing(let user):
            let followController = UIStoryboard.followDetailsStoryboard.followingsViewController
            followController.user = user
            controller.navigationController?.pushViewController(followController, animated: true)
        case .moveToFollowers(let user):
            let followController = UIStoryboard.followDetailsStoryboard.followersViewController
            followController.user = user
            controller.navigationController?.pushViewController(followController, animated: true)
        }
    }
}

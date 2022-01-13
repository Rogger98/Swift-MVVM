//
//  SearchViewNavigator.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import UIKit

enum SearchNavigator {
    
    /// move to follwing list screen
    case moveToFollowing(user: Item)
    
    /// move to followers list screen
    case moveToFollowers(user: Item)
    
    /// move to profile details screen
    case moveToProfile(user: Item)
}

class SearchViewNavigator {
    
    let controller: SearchViewController
    init(_ viewController: SearchViewController) {
        controller = viewController
    }
    
    func moveTo(navigator: SearchNavigator) {
        switch navigator {
        case .moveToFollowing(let user):
            guard let preController = controller.navigationController?.viewControllers.first(where: {$0.isKind(of: FollowingViewController.self)}) as? FollowingViewController else {
                let followController = UIStoryboard.followDetailsStoryboard.getViewController(FollowingViewController.self)
                followController.user = user
                controller.navigationController?.pushViewController(followController, animated: true)
                return
            }
            preController.user = user
            controller.navigationController?.pushViewController(preController, animated: true)
        case .moveToFollowers(let user):
            
            guard let preController = controller.navigationController?.viewControllers.first(where: {$0.isKind(of: FollowersViewController.self)}) as? FollowingViewController else {
                let followController = UIStoryboard.followDetailsStoryboard.getViewController(FollowersViewController.self)
                followController.user = user
                controller.navigationController?.pushViewController(followController, animated: true)
                return
            }
            preController.user = user
            controller.navigationController?.pushViewController(preController, animated: true)
        case .moveToProfile(let user):
            let profileVc = UIStoryboard.profileStoryboard.getViewController(ProfileViewController.self)
            profileVc.user = user
            controller.navigationController?.pushViewController(profileVc, animated: true)
        }
    }
}

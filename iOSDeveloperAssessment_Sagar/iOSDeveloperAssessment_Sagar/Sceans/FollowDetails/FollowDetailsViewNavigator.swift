//
//  FollowDetailsViewNavigator.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import UIKit


enum FollowDetailsNavigator {
    case moveToFollowing(user: Item)
    case moveToFollowers(user: Item)
    case moveToProfile(user: Item)
}

class FollowViewingNavigator {
    
    let controller: FollowingViewController
    init(_ viewController: FollowingViewController) {
        controller = viewController
    }
    func moveTo(navigator: SearchNavigator) {
        switch navigator {
        case .moveToFollowing(let user):
            let followController = UIStoryboard.followDetailsStoryboard.getViewController(FollowingViewController.self)
            followController.user = user
            controller.navigationController?.pushViewController(followController, animated: true)
        case .moveToFollowers(let user):
            let followController = UIStoryboard.followDetailsStoryboard.getViewController(FollowersViewController.self)
            followController.user = user
            controller.navigationController?.pushViewController(followController, animated: true)
        case .moveToProfile(let user):
            let profileVc = UIStoryboard.profileStoryboard.getViewController(ProfileViewController.self)
            profileVc.user = user
            controller.navigationController?.pushViewController(profileVc, animated: true)
            
        }
    }
}

class FollowViewersNavigator {
    
    let controller: FollowersViewController
    init(_ viewController: FollowersViewController) {
        controller = viewController
    }
    func moveTo(navigator: SearchNavigator) {
        switch navigator {
        case .moveToFollowing(let user):
            let followController = UIStoryboard.followDetailsStoryboard.getViewController(FollowingViewController.self)
            followController.user = user
            controller.navigationController?.pushViewController(followController, animated: true)
        case .moveToFollowers(let user):
            let followController = UIStoryboard.followDetailsStoryboard.getViewController(FollowersViewController.self)
            followController.user = user
            controller.navigationController?.pushViewController(followController, animated: true)
        case .moveToProfile(let user):
            let profileVc = UIStoryboard.profileStoryboard.getViewController(ProfileViewController.self)
            profileVc.user = user
            controller.navigationController?.pushViewController(profileVc, animated: true)
            
        }
    }
}

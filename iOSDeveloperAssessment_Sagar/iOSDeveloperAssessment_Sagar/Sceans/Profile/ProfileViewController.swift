//
//  ProfileViewController.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import UIKit
import SkeletonView

class ProfileViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet private var userProfileImageView: UIImageView!
    @IBOutlet private var labelUserName: UILabel!
    @IBOutlet private var labelFullName: UILabel!
    @IBOutlet private var labelLocation: UILabel!
    @IBOutlet private var labelFollowers: UILabel!
    @IBOutlet private var labelFolloweing: UILabel!
    @IBOutlet private var labelBio: UILabel!
    @IBOutlet private var labelEmail: UILabel!
    @IBOutlet private var labelBlog: UILabel!
    @IBOutlet private var iconBlog: UIImageView!
    @IBOutlet private var iconEmail: UIImageView!
    
    // MARK: - Variables
    var user: Item?
    var viewModel: ProfileViewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prepareView()
    }
        
    func prepareView() {
        iconBlog.isHidden = true
        iconEmail.isHidden = true
        view.startSkeletonAnimation()
        loadin()
        guard let userDetails = user?.login?.stringValue else { return  }
        title = userDetails
        viewModel.getUserDetails(user: userDetails) { (user) in
            GCD.onMain(deadline: .now() + 1.0) {
                self.bindAllDetails(userDetails: user)
            }
        }
    }
    func bindAllDetails(userDetails: UserDetails) {
        labelUserName.text = userDetails.name?.stringValue
        labelLocation.text = userDetails.location?.stringValue
        labelFollowers.text = "\(userDetails.followers?.stringValue ?? "") Followers"
        labelFolloweing.text = "\(userDetails.following?.stringValue ?? "") Following"
        if let profile = userDetails.avatarURL?.stringValue {
            userProfileImageView.loadImageFrom(url: profile)
        }
        labelFullName.text = userDetails.login?.stringValue
        labelBio.text = userDetails.bio?.stringValue
        labelEmail.text = userDetails.email?.stringValue
        labelBlog.text = userDetails.blog?.stringValue
        if userDetails.blog?.stringValue != nil && (userDetails.blog?.stringValue ?? "") != ""{
            iconBlog.isHidden = false
        }
        if userDetails.email?.stringValue != nil {
            iconEmail.isHidden = false
        }
        hideSkeletons()
    }
    func loadin() {
        [userProfileImageView,labelUserName,labelFullName,labelLocation,labelFollowers,
         labelFolloweing,labelBio,labelEmail,labelBlog].forEach { (sView) in
            sView?.showGradientSkeleton()
         }
    }
    func hideSkeletons() {
        
        [userProfileImageView,labelUserName,labelFullName,labelLocation,labelFollowers,
         labelFolloweing,labelBio,labelEmail,labelBlog].forEach { (sView) in
            sView?.hideSkeleton()
         }
    }
}

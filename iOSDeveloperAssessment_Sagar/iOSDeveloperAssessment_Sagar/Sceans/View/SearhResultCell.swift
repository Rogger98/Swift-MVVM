//
//  SearhResultCell.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import UIKit
import SkeletonView

class SearhResultCell: UITableViewCell {

    @IBOutlet private weak var labelUserName: UILabel!
    @IBOutlet private weak var userImageView: UIImageView?
    @IBOutlet private weak var buttonFollowers: UIButton?
    @IBOutlet private weak var buttonFollowering: UIButton?
    
    // MARK: - Variables
    var didSelectedFolowing: ((Item) -> Void)?
    var didSelectedFolowers: ((Item) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var userDetails: Item? {
        didSet {
            
            labelUserName?.text = userDetails?.login?.stringValue
            if let imageUrl = userDetails?.avatarURL?.stringValue {
                userImageView?.loadImageFrom(url: imageUrl)
            }
            if !(buttonFollowers?.isSelected ?? false){
                if let flwUrl = userDetails?.followersURL?.stringValue, !flwUrl.isEmpty {
                    WebServices.shared.getAPICall(path: flwUrl, type: [Item].self) { (data) in
                        self.setCountForFollowers(count: data.count)
                    } failuer: { (_, _) in
                        self.setCountForFollowers(count: 0)
                    }

                }

            }
            if !(buttonFollowering?.isSelected ?? false){
                if let flwUrl = userDetails?.followingURL?.stringValue, !flwUrl.isEmpty {
                    let url = "https://api.github.com/users/" + (userDetails?.login?.stringValue ?? "") + "/following"
                    WebServices.shared.getAPICall(path: url, type: [Item].self) { (data) in
                        self.setCountForFollowerings(count: data.count)
                    } failuer: { (_, _) in
                        self.setCountForFollowerings(count: 0)
                    }

                }

            }
                        
        }
    }
    func setCountForFollowers(count: Int) {
        GCD.onMain {
            self.buttonFollowers?.isSelected = true
            self.buttonFollowers?.setTitle("\(count) Followers", for: .selected)
        }
    }
    func setCountForFollowerings(count: Int) {
        GCD.onMain {
            self.buttonFollowering?.isSelected = true
            self.buttonFollowering?.setTitle("\(count) Following", for: .selected)
        }
    }

}
// MARK: - Action Methods
extension SearhResultCell {
    @IBAction private func didTapOnFollowing() {
        if let user = userDetails {
            didSelectedFolowing?(user)
        }
    }
    @IBAction private func didTapOnFollowers() {
        if let user = userDetails {
            didSelectedFolowers?(user)
        }
    }
}

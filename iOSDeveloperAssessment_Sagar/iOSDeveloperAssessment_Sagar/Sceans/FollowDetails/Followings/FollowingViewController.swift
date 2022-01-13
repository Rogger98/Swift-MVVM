//
//  FollowingViewController.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import UIKit

class FollowingViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet private var tableView: UITableView!
    
    
    // MARK: - Variables
    var user: Item?
    var viewModel: FollowDetailsViewModel = FollowDetailsViewModel()
    var navigator: FollowViewingNavigator?
    var showSkeleton: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prepareUI()
        setupBindings()
    }
    
    func setupBindings() {
        navigator = FollowViewingNavigator(self)
        if let followingsUrl = user?.login?.stringValue{
            let path = "https://api.github.com/users/" + followingsUrl + "/following"
            viewModel.getUserFollowdetails(followersUrl: path)
        }
        viewModel.didReceivedFollowDetails = { [weak self] in
            guard let `self` = self else { return  }
            self.showSkeleton = false
            GCD.onMain {
                self.tableView.reloadData()
            }
        }
        viewModel.apiErrorMessage = { (networkError,responseError)  in
            self.showAPIError(message: networkError, responseError: responseError)
        }
    }
    private func prepareUI() {
        title = "Following"
    }
}
extension FollowingViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showSkeleton ? 10 : viewModel.arrayFollows.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.registerAndGetCell(SearhResultCell.self) else { return UITableViewCell() }
        if !showSkeleton {
            cell.userDetails = viewModel.arrayFollows[indexPath.row]
            cell.didSelectedFolowing = { [weak self] user  in
                guard let `self` = self else { return  }
                self.navigator?.moveTo(navigator: .moveToFollowing(user: user))
            }
            cell.didSelectedFolowers = { [weak self] user  in
                guard let `self` = self else { return  }
                self.navigator?.moveTo(navigator: .moveToFollowers(user: user))
            }
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !showSkeleton {
            navigator?.moveTo(navigator: .moveToProfile(user: viewModel.arrayFollows[indexPath.row]))
        }
    }
}


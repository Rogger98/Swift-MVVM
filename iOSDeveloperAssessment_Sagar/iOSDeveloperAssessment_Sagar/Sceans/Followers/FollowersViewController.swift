//
//  FollowersViewController.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import UIKit

class FollowersViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private var tableView: UITableView!
    
    
    // MARK: - Variables
    var user: Item?
    var viewModel: FollowDetailsViewModel = FollowDetailsViewModel()
    var navigator: FollowersViewNavigator?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupBindings()
    }
    
    func setupBindings() {
        navigator = FollowersViewNavigator(self)
        if let path = user?.followersURL?.stringValue{
            viewModel.getUserFollowdetails(followersUrl: path)
        }
        viewModel.didReceivedFollowDetails = { [weak self] in
            guard let `self` = self else { return  }
            GCD.onMain {
                self.tableView.reloadData()
            }
        }
    }

}
extension FollowersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrayFollows.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.registerAndGetCell(SearhResultCell.self) else { return UITableViewCell() }
        cell.userDetails = viewModel.arrayFollows[indexPath.row]
        cell.didSelectedFolowing = { [weak self] user  in
            guard let `self` = self else { return  }
            self.navigator?.moveTo(navigator: .moveToFollowing(user: user))
        }
        cell.didSelectedFolowers = { [weak self] user  in
            guard let `self` = self else { return  }
            self.navigator?.moveTo(navigator: .moveToFollowers(user: user))
        }
        return cell
    }
}

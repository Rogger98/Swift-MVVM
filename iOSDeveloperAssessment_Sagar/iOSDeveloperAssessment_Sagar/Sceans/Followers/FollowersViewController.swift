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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupBindings()
    }
    
    func setupBindings() {
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
        return cell
    }
}
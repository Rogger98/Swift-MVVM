//
//  SearchViewController.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import UIKit
import SkeletonView

class SearchViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet private weak var tableSearchResult: UITableView!
    @IBOutlet private weak var viewNotFound: UIView!
    @IBOutlet private weak var labelEmpty: UILabel!
    @IBOutlet private weak var textFieldSearch: UITextField!
    // MARK: - Variables
    var viewModel: SearchViewModel = SearchViewModel()
    var navigator: SearchViewNavigator?
    var showSkeleton: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupBindings()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    private func setupBindings() {
        let refreshController = UIRefreshControl()
        refreshController.addTarget(self, action: #selector(refreshUsers), for: .valueChanged)
        tableSearchResult.refreshControl = refreshController
        navigator = SearchViewNavigator(self)
        viewModel.searchResultUpdated = { [weak self] in
            guard let `self` = self else { return  }
            GCD.onMain {
                self.showSkeleton = false
                self.tableSearchResult.reloadData()
                self.viewNotFound.isHidden = !self.viewModel.arraySearchUsers.isEmpty
                self.tableSearchResult.refreshControl?.endRefreshing()
            }
        }
        self.textFieldSearch.text = "jinuman"
        viewModel.searchForUser("jinuman")
    }
    @objc func refreshUsers() {
        viewModel.page = 1
        viewModel.isInCompleteResult = false
        viewModel.searchForUser(textFieldSearch.text ?? "")
    }
    // MARK: - Action Methods
    @IBAction private func didSearchText(sender: UITextField) {
        if let search = sender.text , !search.isEmpty {
            viewModel.searchForUser(search)
        }
    }
}
extension SearchViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showSkeleton ? 10 : viewModel.arraySearchUsers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.registerAndGetCell(SearhResultCell.self) else { return UITableViewCell() }
        if !showSkeleton {
            cell.userDetails = viewModel.arraySearchUsers[indexPath.row]
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
            navigator?.moveTo(navigator: .moveToProfile(user: viewModel.arraySearchUsers[indexPath.row]))
        }
        
    }
}

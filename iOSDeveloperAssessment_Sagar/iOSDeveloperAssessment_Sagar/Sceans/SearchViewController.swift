//
//  SearchViewController.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import UIKit
import SkeletonView
import UIScrollView_InfiniteScroll

class SearchViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet private weak var tableSearchResult: UITableView!
    @IBOutlet private weak var viewNotFound: UIView!
    @IBOutlet private weak var labelEmpty: UILabel!
    @IBOutlet private weak var textFieldSearch: UITextField!
    @IBOutlet private weak var toolBar: UIToolbar!
    
    // MARK: - Variables
    var viewModel: SearchViewModel = SearchViewModel()
    var navigator: SearchViewNavigator?
    var showSkeleton: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        prepareUI()
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
        navigator = SearchViewNavigator(self)
        viewModel.searchResultUpdated = { [weak self] in
            guard let `self` = self else { return  }
            GCD.onMain {
                self.showSkeleton = false
                self.tableSearchResult.reloadData()
                self.viewNotFound.isHidden = !self.viewModel.arraySearchUsers.isEmpty
                self.tableSearchResult.refreshControl?.endRefreshing()
                self.reloadEmptyView()
            }
        }
        tableSearchResult.addInfiniteScroll { (table) in
            if !self.viewModel.isInCompleteResult && self.viewModel.arraySearchUsers.count != self.viewModel.totalPage{
                self.viewModel.page += 1
                self.viewModel.searchForUser(self.textFieldSearch.text ?? "")
            }
        }
        viewModel.apiErrorMessage = { (networkError,responseError)  in
            self.showAPIError(message: networkError, responseError: responseError)
        }
    }
    private func prepareUI() {
        viewModel.searchForUser("jinuman")
        textFieldSearch.clearButtonMode = .whileEditing
        tableSearchResult.keyboardDismissMode = .onDrag
        textFieldSearch.inputAccessoryView = toolBar
        self.reloadEmptyView()
        let refreshController = UIRefreshControl()
        refreshController.addTarget(self, action: #selector(refreshUsers), for: .valueChanged)
        tableSearchResult.refreshControl = refreshController
    }
    @objc func refreshUsers() {
        viewModel.page = 1
        viewModel.isInCompleteResult = false
        viewModel.searchForUser(textFieldSearch.text ?? "")
    }
    func loadingApiResult() {
        viewNotFound.isHidden = true
        self.viewModel.page = 1
        self.showSkeleton = true
        tableSearchResult.reloadData()
    }
    func reloadEmptyView() {
        let message = self.viewModel.arraySearchUsers.isEmpty && (textFieldSearch.text ?? "").isEmpty ? "Welcome to the assesment app." : "Not Found"
        labelEmpty.text = message
        viewNotFound.isHidden = !viewModel.arraySearchUsers.isEmpty
    }
}

// MARK: - Action Methods
extension SearchViewController {
    
    @IBAction private func didSearchText(sender: UITextField) {        
        if let search = sender.text , !search.isEmpty {
            loadingApiResult()
            viewModel.searchForUser(search)
        } else {
            viewModel.arraySearchUsers.removeAll()
            reloadEmptyView()
            tableSearchResult.reloadData()
        }
    }
    @IBAction private func didTapOnSearch() {
        if let search = textFieldSearch.text , !search.isEmpty {
            viewModel.searchForUser(search)
        }
    }
    @IBAction private func didTapOnDone() {
        view.endEditing(true)
    }
}
// MARK: - Table View DataSource & Delegate
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

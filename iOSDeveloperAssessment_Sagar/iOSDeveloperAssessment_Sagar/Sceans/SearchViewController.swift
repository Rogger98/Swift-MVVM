//
//  SearchViewController.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var tableSearchResult: UITableView!
    
    // MARK: - Variables
    var viewModel: SearchViewModel = SearchViewModel()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupBindings()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupBindings() {
        
        viewModel.searchResultUpdated = { [weak self] in
            GCD.onMain {
                self?.tableSearchResult.reloadData()
            }
        }
        viewModel.searchForUser("Sagar")
    }
    
    // MARK: - Action Methods
    @IBAction private func didSearchText(sender: UITextField) {
        if let search = sender.text , !search.isEmpty {
            viewModel.searchForUser(search)
        }
    }
}
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arraySearchUsers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.registerAndGetCell(SearhResultCell.self) else { return UITableViewCell() }
        cell.userDetails = viewModel.arraySearchUsers[indexPath.row]
        return cell
    }
}

//
//  SearchViewController.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import UIKit

class SearchViewController: UIViewController {

    var viewModel: SearchViewModel = SearchViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupBindings()
    }
    
    private func setupBindings() {
        
        viewModel.searchResultUpdated = { [weak self] result in
            print("SearchResult Updated")            
        }
        viewModel.searchForUser("Sagar")
    }
}

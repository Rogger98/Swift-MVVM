//
//  BaseViewController.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavigationbar()
    }
    
    private func setupNavigationbar() {
        navigationItem.backButtonTitle = ""
        navigationController?.navigationItem.backButtonTitle = ""
        navigationItem.backBarButtonItem?.title = ""
        navigationController?.navigationBar.backItem?.backButtonTitle = ""
    }

}

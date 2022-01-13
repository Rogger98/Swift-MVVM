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

    func showAlertMessage(message: String,theam: AlertTheam, actions: [UIAlertAction]) {
        let alert = UIAlertController(title: theam.title, message: message, preferredStyle: .alert)
        actions.forEach { (buttonAction) in
            alert.addAction(buttonAction)
        }
        if actions.isEmpty {
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        }
        present(alert, animated: true, completion: nil)
    }
    
    func showAPIError(message: String?,responseError: ResponseErrorDetails?) {
        GCD.onMain {
            if let msg = message , !msg.isEmpty {
                self.showAlertMessage(message: msg, theam: .error, actions: [])
            } else if let msg = responseError?.message?.stringValue {
                self.showAlertMessage(message: msg, theam: .error, actions: [])
            }
            
        }
    }
}

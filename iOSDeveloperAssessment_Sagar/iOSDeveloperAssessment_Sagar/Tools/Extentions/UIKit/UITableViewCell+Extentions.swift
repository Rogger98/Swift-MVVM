//
//  UITableViewCell+Extentions.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import UIKit

extension UITableView {
    
    /// get cell by it's class it requires cell class name as me UINib name
    func registerAndGetCell<T: UITableViewCell>(_ cell: T.Type) -> T? {
        let cellId = String(describing: cell.self)
        if let cell = dequeueReusableCell(withIdentifier: cellId) as? T {
            return cell
        }
        register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        return dequeueReusableCell(withIdentifier: cellId) as? T
    }
}

//
//  APIRouter+Path.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import Foundation

extension APIRouter {
    var path: String {
        switch self {
        case .searchUser(let user,let page):
            return "https://api.github.com/search/users?q=\(user)&page=\(page)"
        case .userDetails(let userName):
            return "https://api.github.com/users/\(userName)"
        }
    }
}

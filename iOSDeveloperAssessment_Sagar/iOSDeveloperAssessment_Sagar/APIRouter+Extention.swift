//
//  APIRouter+Extention.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import Foundation

extension APIRouter {
    var parameters: [String : Any]? {
        switch self {
        case .searchUser:
            return nil
        }
    }
}

extension APIRouter {
    var methodType: HTTPMethod {
        switch self {
        case .searchUser:
            return .get
        }
    }
}

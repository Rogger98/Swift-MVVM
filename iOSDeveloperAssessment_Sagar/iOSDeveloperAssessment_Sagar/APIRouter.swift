//
//  APIRouter.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import Foundation

enum HTTPMethod : String{
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}


protocol Router {
    var path: String { get }
    var parameters: [ String: Any]? { get }
    var methodType : HTTPMethod { get }
}


enum APIRouter: Router {
    case searchUser(userName: String,page: Int)
}


enum ResponseError  : Int{
    case anyError = 200
    case errorDecode = 111
    var message : String {
        switch self {
        case .anyError:
            return "other Error"
        case .errorDecode:
            return "Decode result"
        
        }
    }
}

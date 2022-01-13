//
//  SearchViewModel.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import Foundation


class SearchViewModel {
    
    var page: Int = 0
    var searchResultUpdated : ((SearchResult) -> ())?
    
    
    func searchForUser(_ user: String) {
        getSearchResult(search: user, page: page)
    }
    
    private func getSearchResult(search: String,page: Int) {
        WebServices.shared.makeRequest(route: .searchUser(userName: search, page: page), type: SearchResult.self) { (data) in
            dump(data)
        } failuer: { (message, responseError) in
            
        }

    }
}

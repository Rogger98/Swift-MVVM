//
//  SearchViewModel.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import Foundation


class SearchViewModel {
    
    var page: Int = 1
    var totalPage = 0
    var isInCompleteResult: Bool = false
    var searchResultUpdated : (() -> ())?
    var arraySearchUsers: [Item] = [Item]()
    
    
    func searchForUser(_ user: String) {
        getSearchResult(search: user, page: page)
    }
    
    private func getSearchResult(search: String,page: Int) {
        WebServices.shared.makeRequest(route: .searchUser(userName: search, page: page), type: SearchResult.self) { (data) in
//            dump(data)
            self.totalPage = data.totalCount?.intValue ?? 0
            self.isInCompleteResult = data.incompleteResults?.boolValue ?? false
            if page == 1 {
                self.arraySearchUsers.removeAll()
            }
            self.arraySearchUsers.append(contentsOf: data.items ?? [])
            self.searchResultUpdated?()
        } failuer: { (message, responseError) in
            print("Error API CALL")
        }
    }
}

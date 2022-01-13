//
//  SearchResult.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import Foundation

// MARK: - SearchResult
struct SearchResult: Codable {
    let incompleteResults: Generic?
    let items: [Item]?
    let totalCount: Generic?

    enum CodingKeys: String, CodingKey {
        case incompleteResults = "incomplete_results"
        case items
        case totalCount = "total_count"
    }
}

// MARK: - Item
struct Item: Codable {
    let avatarURL: Generic?
    let eventsURL: Generic?
    let followersURL: Generic?
    let followingURL, gistsURL, gravatarID: Generic?
    let htmlURL: Generic?
    let id: Generic?
    let login, nodeID: Generic?
    let organizationsURL, receivedEventsURL, reposURL: Generic?
    let score, siteAdmin: Generic?
    let starredURL: Generic?
    let subscriptionsURL: Generic?
    let type: Generic?
    let url: Generic?

    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
        case eventsURL = "events_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case gravatarID = "gravatar_id"
        case htmlURL = "html_url"
        case id, login
        case nodeID = "node_id"
        case organizationsURL = "organizations_url"
        case receivedEventsURL = "received_events_url"
        case reposURL = "repos_url"
        case score
        case siteAdmin = "site_admin"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case type, url
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        avatarURL = try container.decodeIfPresent(Generic.self, forKey: .avatarURL)
        eventsURL = try container.decodeIfPresent(Generic.self, forKey: .eventsURL)
        followersURL = try container.decodeIfPresent(Generic.self, forKey: .followersURL)
        followingURL = try container.decodeIfPresent(Generic.self, forKey: .followingURL)
        htmlURL = try container.decodeIfPresent(Generic.self, forKey: .htmlURL)
        id = try container.decodeIfPresent(Generic.self, forKey: .id)
        login = try container.decodeIfPresent(Generic.self, forKey: .login)
        organizationsURL = try container.decodeIfPresent(Generic.self, forKey: .organizationsURL)
        score = try container.decodeIfPresent(Generic.self, forKey: .score)
        starredURL = try container.decodeIfPresent(Generic.self, forKey: .starredURL)
        subscriptionsURL = try container.decodeIfPresent(Generic.self, forKey: .subscriptionsURL)
        type = try container.decodeIfPresent(Generic.self, forKey: .type)
        url = try container.decodeIfPresent(Generic.self, forKey: .url)
        gistsURL = try container.decodeIfPresent(Generic.self, forKey: .gistsURL)
        gravatarID = try container.decodeIfPresent(Generic.self, forKey: .gravatarID)
        receivedEventsURL = try container.decodeIfPresent(Generic.self, forKey: .receivedEventsURL)
        siteAdmin = try container.decodeIfPresent(Generic.self, forKey: .siteAdmin)
        reposURL = try container.decodeIfPresent(Generic.self, forKey: .reposURL)
        nodeID = try container.decodeIfPresent(Generic.self, forKey: .nodeID)
        
    }
}

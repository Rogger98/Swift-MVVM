//
//  UserDetails.swift
//  iOSDeveloperAssessment_Sagar
//
//  Created by psagc on 13/01/22.
//

import Foundation

struct UserDetails: Codable {
    
    let login: Generic?
    let id: Generic?
    let nodeID: Generic?
    let avatarURL: Generic?
    let gravatarID: Generic?
    let url, htmlURL, followersURL: Generic?
    let followingURL, gistsURL, starredURL: Generic?
    let subscriptionsURL, organizationsURL, reposURL: Generic?
    let eventsURL: Generic?
    let receivedEventsURL: Generic?
    let type: Generic?
    let siteAdmin: Generic?
    let name: Generic?
    let company: Generic?
    let blog, location: Generic?
    let email, hireable, bio, twitterUsername: Generic?
    let publicRepos, publicGists, followers, following: Generic?
    let createdAt, updatedAt: Generic?

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
        case name, company, blog, location, email, hireable, bio
        case twitterUsername = "twitter_username"
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers, following
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        login = try container.decodeIfPresent(Generic.self, forKey: .login)
        id = try container.decodeIfPresent(Generic.self, forKey: .id)
        nodeID = try container.decodeIfPresent(Generic.self, forKey: .nodeID)
        avatarURL = try container.decodeIfPresent(Generic.self, forKey: .avatarURL)
        gravatarID = try container.decodeIfPresent(Generic.self, forKey: .gravatarID)
        url = try container.decodeIfPresent(Generic.self, forKey: .url)
        followers = try container.decodeIfPresent(Generic.self, forKey: .followers)
        following = try container.decodeIfPresent(Generic.self, forKey: .following)
        subscriptionsURL = try container.decode(Generic.self, forKey: .subscriptionsURL)
        eventsURL = try container.decodeIfPresent(Generic.self, forKey: .eventsURL)
        receivedEventsURL = try container.decodeIfPresent(Generic.self, forKey: .receivedEventsURL)
        type = try container.decodeIfPresent(Generic.self, forKey: .type)
        siteAdmin = try container.decodeIfPresent(Generic.self, forKey: .siteAdmin)
        name = try container.decodeIfPresent(Generic.self, forKey: .name)
        company = try container.decodeIfPresent(Generic.self, forKey: .company)
        blog = try container.decodeIfPresent(Generic.self, forKey: .blog)
        email = try container.decodeIfPresent(Generic.self, forKey: .email)
        publicRepos = try container.decodeIfPresent(Generic.self, forKey: .publicGists)
        createdAt = try container.decodeIfPresent(Generic.self, forKey: .createdAt)
        updatedAt = try container.decodeIfPresent(Generic.self, forKey: .updatedAt)
        followersURL = try container.decodeIfPresent(Generic.self, forKey: .followersURL)
        followingURL = try container.decodeIfPresent(Generic.self, forKey: .followingURL)
        htmlURL = try container.decodeIfPresent(Generic.self, forKey: .htmlURL)
        location = try container.decodeIfPresent(Generic.self, forKey: .location)
        hireable = try container.decodeIfPresent(Generic.self, forKey: .hireable)
        bio = try container.decodeIfPresent(Generic.self, forKey: .bio)
        twitterUsername =  try container.decodeIfPresent(Generic.self, forKey: .twitterUsername)
        publicGists = try container.decodeIfPresent(Generic.self, forKey: .publicGists)
        starredURL = try container.decodeIfPresent(Generic.self, forKey: .starredURL)
        organizationsURL = try container.decodeIfPresent(Generic.self, forKey: .organizationsURL)
        reposURL = try container.decodeIfPresent(Generic.self, forKey: .reposURL)
        gistsURL = try container.decodeIfPresent(Generic.self, forKey: .gistsURL)
    }
}

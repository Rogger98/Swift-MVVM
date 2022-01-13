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
        self.login = try container.decodeIfPresent(Generic.self, forKey: .login)
        self.id = try container.decodeIfPresent(Generic.self, forKey: .id)
        self.nodeID = try container.decodeIfPresent(Generic.self, forKey: .nodeID)
        self.avatarURL = try container.decodeIfPresent(Generic.self, forKey: .avatarURL)
        self.gravatarID = try container.decodeIfPresent(Generic.self, forKey: .gravatarID)
        self.url = try container.decodeIfPresent(Generic.self, forKey: .url)
        self.followers = try container.decodeIfPresent(Generic.self, forKey: .followers)
        self.following = try container.decodeIfPresent(Generic.self, forKey: .following)
        self.subscriptionsURL = try container.decode(Generic.self, forKey: .subscriptionsURL)
        self.eventsURL = try container.decodeIfPresent(Generic.self, forKey: .eventsURL)
        self.receivedEventsURL = try container.decodeIfPresent(Generic.self, forKey: .receivedEventsURL)
        self.type = try container.decodeIfPresent(Generic.self, forKey: .type)
        self.siteAdmin = try container.decodeIfPresent(Generic.self, forKey: .siteAdmin)
        self.name = try container.decodeIfPresent(Generic.self, forKey: .name)
        self.company = try container.decodeIfPresent(Generic.self, forKey: .company)
        self.blog = try container.decodeIfPresent(Generic.self, forKey: .blog)
        self.email = try container.decodeIfPresent(Generic.self, forKey: .email)
        self.publicRepos = try container.decodeIfPresent(Generic.self, forKey: .publicGists)
        self.createdAt = try container.decodeIfPresent(Generic.self, forKey: .createdAt)
        self.updatedAt = try container.decodeIfPresent(Generic.self, forKey: .updatedAt)
        self.followersURL = try container.decodeIfPresent(Generic.self, forKey: .followersURL)
        self.followingURL = try container.decodeIfPresent(Generic.self, forKey: .followingURL)
        self.htmlURL = try container.decodeIfPresent(Generic.self, forKey: .htmlURL)
        self.location = try container.decodeIfPresent(Generic.self, forKey: .location)
        self.hireable = try container.decodeIfPresent(Generic.self, forKey: .hireable)
        self.bio = try container.decodeIfPresent(Generic.self, forKey: .bio)
        self.twitterUsername =  try container.decodeIfPresent(Generic.self, forKey: .twitterUsername)
        self.publicGists = try container.decodeIfPresent(Generic.self, forKey: .publicGists)
        self.starredURL = try container.decodeIfPresent(Generic.self, forKey: .starredURL)
        self.organizationsURL = try container.decodeIfPresent(Generic.self, forKey: .organizationsURL)
        self.reposURL = try container.decodeIfPresent(Generic.self, forKey: .reposURL)
        self.gistsURL = try container.decodeIfPresent(Generic.self, forKey: .gistsURL)
    }
}

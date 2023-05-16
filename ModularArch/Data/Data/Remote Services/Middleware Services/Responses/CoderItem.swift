//
//  CoderItem.swift
//  CodersList
//
//  Created by Mohamed Salem on 21/03/2022.
//

import Foundation

public struct CoderItem: Codable {
    public let id: Int
    public let nodeID: String
    public let name: String
    public let fullName: String
    public let welcomePrivate: Bool
    public let owner: Owner
    public let htmlURL: String
    public let welcomeDescription: String?
    public let fork: Bool
    public let url: String
    public let forksURL: String
    public let keysURL: String
    public let collaboratorsURL: String
    public let teamsURL: String
    public let hooksURL: String
    public let issueEventsURL: String
    public let eventsURL: String
    public let assigneesURL: String
    public let branchesURL: String
    public let tagsURL: String
    public let blobsURL: String
    public let gitTagsURL: String
    public let gitRefsURL: String
    public let treesURL: String
    public let statusesURL: String
    public let languagesURL: String
    public let stargazersURL: String
    public let contributorsURL: String
    public let subscribersURL: String
    public let subscriptionURL: String
    public let commitsURL: String
    public let gitCommitsURL: String
    public let commentsURL: String
    public let issueCommentURL: String
    public let contentsURL: String
    public let compareURL: String
    public let mergesURL: String
    public let archiveURL: String
    public let downloadsURL: String
    public let issuesURL: String
    public let pullsURL: String
    public let milestonesURL: String
    public let notificationsURL: String
    public let labelsURL: String
    public let releasesURL: String
    public let deploymentsURL: String
    public var isSelected: Bool = false
    public init(id: Int, nodeID: String, name: String, fullName: String, welcomePrivate: Bool, owner: Owner, htmlURL: String, welcomeDescription: String?, fork: Bool, url: String, forksURL: String, keysURL: String, collaboratorsURL: String, teamsURL: String, hooksURL: String, issueEventsURL: String, eventsURL: String, assigneesURL: String, branchesURL: String, tagsURL: String, blobsURL: String, gitTagsURL: String, gitRefsURL: String, treesURL: String, statusesURL: String, languagesURL: String, stargazersURL: String, contributorsURL: String, subscribersURL: String, subscriptionURL: String, commitsURL: String, gitCommitsURL: String, commentsURL: String, issueCommentURL: String, contentsURL: String, compareURL: String, mergesURL: String, archiveURL: String, downloadsURL: String, issuesURL: String, pullsURL: String, milestonesURL: String, notificationsURL: String, labelsURL: String, releasesURL: String, deploymentsURL: String, isSelected: Bool) {
        self.id = id
        self.nodeID = nodeID
        self.name = name
        self.fullName = fullName
        self.welcomePrivate = welcomePrivate
        self.owner = owner
        self.htmlURL = htmlURL
        self.welcomeDescription = welcomeDescription
        self.fork = fork
        self.url = url
        self.forksURL = forksURL
        self.keysURL = keysURL
        self.collaboratorsURL = collaboratorsURL
        self.teamsURL = teamsURL
        self.hooksURL = hooksURL
        self.issueEventsURL = issueEventsURL
        self.eventsURL = eventsURL
        self.assigneesURL = assigneesURL
        self.branchesURL = branchesURL
        self.tagsURL = tagsURL
        self.blobsURL = blobsURL
        self.gitTagsURL = gitTagsURL
        self.gitRefsURL = gitRefsURL
        self.treesURL = treesURL
        self.statusesURL = statusesURL
        self.languagesURL = languagesURL
        self.stargazersURL = stargazersURL
        self.contributorsURL = contributorsURL
        self.subscribersURL = subscribersURL
        self.subscriptionURL = subscriptionURL
        self.commitsURL = commitsURL
        self.gitCommitsURL = gitCommitsURL
        self.commentsURL = commentsURL
        self.issueCommentURL = issueCommentURL
        self.contentsURL = contentsURL
        self.compareURL = compareURL
        self.mergesURL = mergesURL
        self.archiveURL = archiveURL
        self.downloadsURL = downloadsURL
        self.issuesURL = issuesURL
        self.pullsURL = pullsURL
        self.milestonesURL = milestonesURL
        self.notificationsURL = notificationsURL
        self.labelsURL = labelsURL
        self.releasesURL = releasesURL
        self.deploymentsURL = deploymentsURL
        self.isSelected = isSelected
    }
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case nodeID = "node_id"
        case name = "name"
        case fullName = "full_name"
        case welcomePrivate = "private"
        case owner = "owner"
        case htmlURL = "html_url"
        case welcomeDescription = "description"
        case fork = "fork"
        case url = "url"
        case forksURL = "forks_url"
        case keysURL = "keys_url"
        case collaboratorsURL = "collaborators_url"
        case teamsURL = "teams_url"
        case hooksURL = "hooks_url"
        case issueEventsURL = "issue_events_url"
        case eventsURL = "events_url"
        case assigneesURL = "assignees_url"
        case branchesURL = "branches_url"
        case tagsURL = "tags_url"
        case blobsURL = "blobs_url"
        case gitTagsURL = "git_tags_url"
        case gitRefsURL = "git_refs_url"
        case treesURL = "trees_url"
        case statusesURL = "statuses_url"
        case languagesURL = "languages_url"
        case stargazersURL = "stargazers_url"
        case contributorsURL = "contributors_url"
        case subscribersURL = "subscribers_url"
        case subscriptionURL = "subscription_url"
        case commitsURL = "commits_url"
        case gitCommitsURL = "git_commits_url"
        case commentsURL = "comments_url"
        case issueCommentURL = "issue_comment_url"
        case contentsURL = "contents_url"
        case compareURL = "compare_url"
        case mergesURL = "merges_url"
        case archiveURL = "archive_url"
        case downloadsURL = "downloads_url"
        case issuesURL = "issues_url"
        case pullsURL = "pulls_url"
        case milestonesURL = "milestones_url"
        case notificationsURL = "notifications_url"
        case labelsURL = "labels_url"
        case releasesURL = "releases_url"
        case deploymentsURL = "deployments_url"
    }
}

// MARK: - Owner
public struct Owner: Codable {
    public let login: String
    public let id: Int
    public let nodeID: String
    public let avatarURL: String
    public let gravatarID: String
    public let url: String
    public let htmlURL: String
    public let followersURL: String
    public let followingURL: String
    public let gistsURL: String
    public let starredURL: String
    public let subscriptionsURL: String
    public let organizationsURL: String
    public let reposURL: String
    public let eventsURL: String
    public let receivedEventsURL: String
    public let type: TypeEnum
    public let siteAdmin: Bool
    public init(login: String,
                id: Int,
                nodeID: String,
                avatarURL: String,
                gravatarID: String,
                url: String,
                htmlURL: String,
                followersURL: String,
                followingURL: String,
                gistsURL: String,
                starredURL: String,
                subscriptionsURL: String,
                organizationsURL: String,
                reposURL: String,
                eventsURL: String,
                receivedEventsURL: String,
                type: TypeEnum,
                siteAdmin: Bool) {
        self.login = login
        self.id = id
        self.nodeID = nodeID
        self.avatarURL = avatarURL
        self.gravatarID = gravatarID
        self.url = url
        self.htmlURL = htmlURL
        self.followersURL = followersURL
        self.followingURL = followingURL
        self.gistsURL = gistsURL
        self.starredURL = starredURL
        self.subscriptionsURL = subscriptionsURL
        self.organizationsURL = organizationsURL
        self.reposURL = reposURL
        self.eventsURL = eventsURL
        self.receivedEventsURL = receivedEventsURL
        self.type = type
        self.siteAdmin = siteAdmin
    }
    enum CodingKeys: String, CodingKey {
        case login = "login"
        case id = "id"
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url = "url"
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
        case type = "type"
        case siteAdmin = "site_admin"
    }
}

public enum TypeEnum: String, Codable {
    case organization = "Organization"
    case user = "User"
}

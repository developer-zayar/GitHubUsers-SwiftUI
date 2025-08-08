//
//  GitHubUser.swift
//  GitHubUsers
//
//  Created by Zay Yar Phyo on 03/08/2025.
//

import Foundation

struct GitHubUser: Identifiable {
    let id = UUID()
    let username: String
    let name: String
    let imageUrl: String
    let followers: Int
    let following: Int
    let repositories: [GitHubRepository]
}

struct GitHubRepository: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let language: String
    let stars: Int
}

let sampleUsers: [GitHubUser] = [
    GitHubUser(
        username: "mojombo",
        name: "Tom Preston-Werner",
        imageUrl: "https://avatars.githubusercontent.com/u/1?v=4",
        followers: 24283,
        following: 11,
        repositories: [
            GitHubRepository(name: "30daysoflaptops.github.io", description: "", language: "CSS", stars: 8),
            GitHubRepository(name: "asteroids", description: "Destroy your Atom editor, Asteroids style!", language: "JavaScript", stars: 96)
        ]
    ),
    GitHubUser(
        username: "defunkt",
        name: "Chris Wanstrath",
        imageUrl: "https://avatars.githubusercontent.com/u/2?v=4",
        followers: 21234,
        following: 32,
        repositories: [
            GitHubRepository(name: "facebox", description: "Facebook-style lightbox, built in JavaScript", language: "JavaScript", stars: 1345),
            GitHubRepository(name: "mustache", description: "Logic-less templates", language: "Ruby", stars: 2860)
        ]
    ),
    GitHubUser(
        username: "pjhyett",
        name: "PJ Hyett",
        imageUrl: "https://avatars.githubusercontent.com/u/3?v=4",
        followers: 18004,
        following: 17,
        repositories: [
            GitHubRepository(name: "hubot", description: "A customizable life embetterment robot", language: "CoffeeScript", stars: 16000),
            GitHubRepository(name: "resque", description: "Redis-backed Ruby library for creating background jobs", language: "Ruby", stars: 9350)
        ]
    ),
    GitHubUser(
        username: "wycats",
        name: "Yehuda Katz",
        imageUrl: "https://avatars.githubusercontent.com/u/4?v=4",
        followers: 15245,
        following: 42,
        repositories: [
            GitHubRepository(name: "ember.js", description: "A JavaScript framework for creating ambitious web apps", language: "JavaScript", stars: 22000),
            GitHubRepository(name: "rails", description: "Ruby on Rails web application framework", language: "Ruby", stars: 53000)
        ]
    ),
    GitHubUser(
        username: "ezmobius",
        name: "Ezra Zygmuntowicz",
        imageUrl: "https://avatars.githubusercontent.com/u/5?v=4",
        followers: 9745,
        following: 5,
        repositories: [
            GitHubRepository(name: "merb-core", description: "Merb Core: All you need. None you don't.", language: "Ruby", stars: 1200),
            GitHubRepository(name: "engineyard", description: "Deployment tools for Engine Yard cloud", language: "Shell", stars: 350)
        ]
    )
]

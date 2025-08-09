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
    let id: Int
    let name: String
    let description: String
    let language: String
    let stars: Int
}

//
//  GitHubUser.swift
//  GitHubUsers
//
//  Created by Zay Yar Phyo on 03/08/2025.
//

import Foundation

struct GitHubUser: Identifiable {
    let id: Int
    let login: String
    let avatarUrl: String
    let name: String
    let followers: Int
    let following: Int
}

struct UserRepository: Identifiable {
    let id: Int
    let name: String
    let description: String
    let language: String
    let stars: Int
}

//
//  GitHubUserMapper.swift
//  GitHubUsers
//
//  Created by Zay Yar Phyo on 09/08/2025.
//

import Foundation

struct GitHubUserMapper {
    func map(response: GitHubUserResponse) -> GitHubUserNew {
        GitHubUserNew(
            id: response.id,
            login: response.login,
            avatarUrl: response.avatar_url,
            name: response.name ?? ""
        )
    }
}

struct GitHubUsersMapper {
    func map(response: [GitHubUserResponse]) -> [GitHubUserNew] {
        response.map {
            GitHubUserMapper().map(response: $0)
        }
    }
}

struct GitHubUserResponse: Identifiable, Decodable {
    let id: Int
    let login: String
    let avatar_url: String
    let name: String?
}

struct GitHubUserNew: Identifiable {
    let id: Int
    let login: String
    let avatarUrl: String
    let name: String
}

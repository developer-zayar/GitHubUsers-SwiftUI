//
//  GitHubUserMapper.swift
//  GitHubUsers
//
//  Created by Zay Yar Phyo on 09/08/2025.
//

import Foundation

protocol ModelMapper {
    associatedtype Input
    associatedtype Output
    func map(input: Input) -> Output
}

struct GitHubUserMapper: ModelMapper {
    typealias Input = GitHubUserResponse
    typealias Output = GitHubUserNew

    func map(input: GitHubUserResponse) -> GitHubUserNew {
        GitHubUserNew(
            id: input.id,
            login: input.login,
            avatarUrl: input.avatar_url,
            name: input.name ?? ""
        )
    }
}

struct GitHubUsersMapper: ModelMapper {
    typealias Input = [GitHubUserResponse]
    typealias Output = [GitHubUserNew]

    func map(input: [GitHubUserResponse]) -> [GitHubUserNew] {
        input.map {
            GitHubUserMapper().map(input: $0)
        }
    }
}

struct RepositoryMapper: ModelMapper {
    typealias Input = RepositoryResponse
    typealias Output = GitHubRepository

    func map(input: RepositoryResponse) -> GitHubRepository {
        GitHubRepository(
            id: input.id,
            name: input.name,
            description: input.description ?? "",
            language: input.language ?? "",
            stars: input.stargazers_count
        )
    }
}

struct RepositoriesMapper: ModelMapper {
    typealias Input = [RepositoryResponse]
    typealias Output = [GitHubRepository]

    func map(input: [RepositoryResponse]) -> [GitHubRepository] {
        input.map {
            RepositoryMapper().map(input: $0)
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

struct RepositoryResponse: Identifiable, Decodable {
    let id: Int
    let name: String
    let description: String?
    let language: String?
    let stargazers_count: Int
}

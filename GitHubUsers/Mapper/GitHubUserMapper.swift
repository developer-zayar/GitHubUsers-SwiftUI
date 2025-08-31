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
    typealias Output = GitHubUser

    func map(input: GitHubUserResponse) -> GitHubUser {
        GitHubUser(
            id: input.id,
            login: input.login,
            avatarUrl: input.avatar_url ?? "",
            name: input.name ?? "",
            followers: input.followers ?? 0,
            following: input.following ?? 0
        )
    }
}

struct GitHubUsersMapper: ModelMapper {
    typealias Input = [GitHubUserResponse]
    typealias Output = [GitHubUser]

    func map(input: [GitHubUserResponse]) -> [GitHubUser] {
        input.map {
            GitHubUserMapper().map(input: $0)
        }
    }
}

struct RepositoryMapper: ModelMapper {
    typealias Input = RepositoryResponse
    typealias Output = UserRepository

    func map(input: RepositoryResponse) -> UserRepository {
        UserRepository(
            id: input.id,
            name: input.name,
            description: input.description ?? "",
            language: input.language ?? "",
            stars: input.stargazers_count ?? 0
        )
    }
}

struct RepositoriesMapper: ModelMapper {
    typealias Input = [RepositoryResponse]
    typealias Output = [UserRepository]

    func map(input: [RepositoryResponse]) -> [UserRepository] {
        input.map {
            RepositoryMapper().map(input: $0)
        }
    }
}

struct GitHubUserResponse: Identifiable, Decodable {
    let id: Int
    let login: String
    let avatar_url: String?
    let name: String?
    let followers: Int?
    let following: Int?
}

struct RepositoryResponse: Identifiable, Decodable {
    let id: Int
    let name: String
    let description: String?
    let language: String?
    let stargazers_count: Int?
}

//
//  GitHubUseCase.swift
//  GitHubUsers
//
//  Created by Zay Yar Phyo on 31/08/2025.
//

import Foundation

protocol GitHubUseCaseDelegate: AnyObject {
    func fetchUsers() async throws -> [GitHubUser]
    func fetchUserDetails(userId: String) async throws -> GitHubUser
    func fetchUserRepositories(userId: String) async throws -> [UserRepository]
}

class GitHubUseCase: GitHubUseCaseDelegate {
    private let repository: GitHubRepositoryDelegate

    init(repository: GitHubRepositoryDelegate = GitHubRepository()) {
        self.repository = repository
    }

    func fetchUsers() async throws -> [GitHubUser] {
        let response = try await repository.fetchUsers()
        return GitHubUsersMapper().map(input: response)
    }

    func fetchUserDetails(userId: String) async throws -> GitHubUser {
        let response = try await repository.fetchUserDetails(userId: userId)
        return GitHubUserMapper().map(input: response)
    }

    func fetchUserRepositories(userId: String) async throws -> [UserRepository] {
        let response = try await repository.fetchRepositories(userId: userId)
        return RepositoriesMapper().map(input: response)
    }
}

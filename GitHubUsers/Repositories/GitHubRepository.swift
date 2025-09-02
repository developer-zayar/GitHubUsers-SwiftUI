//
//  GitHubRepositories.swift
//  GitHubUsers
//
//  Created by Zay Yar Phyo on 30/08/2025.
//

import Foundation

protocol GitHubRepositoryDelegate: AnyObject {
    func fetchUsers() async throws -> [GitHubUserResponse]
    func fetchUserDetails(userId: String) async throws -> GitHubUserResponse
    func fetchRepositories(userId: String) async throws -> [RepositoryResponse]
}

class GitHubRepository: GitHubRepositoryDelegate {
    private let networkClient: NetworkClient

    init(networkClient: NetworkClient = NetworkClient()) {
        self.networkClient = networkClient
    }

    func fetchUsers() async throws -> [GitHubUserResponse] {
        let urlString = "\(AppConfig.baseUrl)/users"
        let response = try await networkClient.getRequest(urlString, type: [GitHubUserResponse].self)
        return response
    }

    func fetchUserDetails(userId: String) async throws -> GitHubUserResponse {
        let urlString = "\(AppConfig.baseUrl)/users/\(userId)"
        let response = try await networkClient.getRequest(urlString, type: GitHubUserResponse.self)
        return response
    }

    func fetchRepositories(userId: String) async throws -> [RepositoryResponse] {
        let urlString = "\(AppConfig.baseUrl)/users/\(userId)/repos"
        let response = try await networkClient.getRequest(urlString, type: [RepositoryResponse].self)
        return response
    }
}

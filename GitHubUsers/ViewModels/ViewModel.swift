//
//  ViewModel.swift
//  GitHubUsers
//
//  Created by Zay Yar Phyo on 31/08/2025.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
    @Published var gitHubUsers: [GitHubUser] = []
    @Published var userDetails: GitHubUser? = nil
    @Published var userRepositories: [UserRepository] = []
    @Published var isLoading: Bool = false

    private let useCase: GitHubUseCaseDelegate

    init(useCase: GitHubUseCaseDelegate = GitHubUseCase()) {
        self.useCase = useCase
    }

    func getGitHubUsers() async {
        isLoading = true
        do {
            let users = try await useCase.fetchUsers()
            gitHubUsers = users
            print("GitHub users: \(gitHubUsers.count)")
        } catch {
            print("Error fetching users: \(error.localizedDescription)")
        }
        isLoading = false
    }

    func getUserDetails(userId: String) async {
        isLoading = true
        do {
            let user = try await useCase.fetchUserDetails(userId: userId)
            userDetails = user
            print("GitHub user details: \(user.name)")
        } catch {
            print("Error fetching user details: \(error.localizedDescription)")
        }
        isLoading = false
    }

    func getUserRepositories(userId: String) async {
        do {
            let userRepos = try await useCase.fetchUserRepositories(userId: userId)
            userRepositories = userRepos
            print("User repositories: \(userRepositories.count)")
        } catch {
            print("Error fetching user repo: \(error)")
        }
    }
}

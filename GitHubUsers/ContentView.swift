//
//  ContentView.swift
//  GitHubUsers
//
//  Created by Zay Yar Phyo on 03/08/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var githubUsers: [GitHubUserNew] = []

    var body: some View {
        NavigationStack {
            List(self.githubUsers) { user in
                NavigationLink(destination: UserDetailView(user: user)) {
                    HStack {
                        AsyncImage(url: URL(string: user.avatarUrl)) { image in
                            image.resizable()
                                .scaledToFit()
                        } placeholder: {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.gray)
                        }
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())

                        Text(user.login)
                            .font(.body)
                    }
//                    .padding()
                }
            }
            .navigationTitle("GitHub Users")
            .task {
                try? await self.getGitHubUsers()
            }
        }
    }

    func getGitHubUsers() async throws {
        let urlString = "https://api.github.com/users"
        guard let url = URL(string: urlString) else {
            return
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let decoded = try JSONDecoder().decode([GitHubUserResponse].self, from: data)
        self.githubUsers = GitHubUsersMapper().map(response: decoded)
    }
}

#Preview {
    ContentView()
}

//
//  UserDetailView.swift
//  GitHubUsers
//
//  Created by Zay Yar Phyo on 08/08/2025.
//

import SwiftUI

struct UserDetailView: View {
    @State var user: GitHubUserNew
    @State var userRepo: [GitHubRepository] = []

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    AsyncImage(url: URL(string: self.user.avatarUrl)) { image in
                        image.resizable()
                            .scaledToFit()
                    } placeholder: {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.gray)
                    }
                    .frame(width: 140, height: 140)
                    .clipShape(Circle())

                    Text(self.user.name)
                        .font(.title)
                        .bold()

//                    Text(self.user.name)
//                        .font(.headline)

                    HStack {
                        Text("Followers: 0")
                        Spacer()
                        Text("Following: 0")
                    }
                    .foregroundStyle(Color.gray)

                    Text("Repositories")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()

                    ForEach(self.userRepo) { repository in
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text(repository.name)
                                    .font(.headline)
                                    .foregroundStyle(Color.blue)

                                Spacer()

                                Image(systemName: "star.fill")
                                    .foregroundStyle(Color.orange)

                                Text("\(repository.stars)")
                            }

                            Text(repository.language)
                                .font(.subheadline)

                            Text(repository.description)
                        }
                        .padding(.vertical)

                        Divider()
                    }
                }
                .padding()
            }
            .navigationTitle(self.user.login)
            .task {
                try? await self.getUserDetail()
                try? await self.getUserRepositories()
            }
        }
    }

    func getUserDetail() async throws {
        let urlString = "https://api.github.com/users/\(user.login)"
        guard let url = URL(string: urlString) else {
            return
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let response = try JSONDecoder().decode(GitHubUserResponse.self, from: data)
        self.user = GitHubUserMapper().map(input: response)
    }

    func getUserRepositories() async throws {
        let urlString = "https://api.github.com/users/\(user.login)/repos"
        guard let url = URL(string: urlString) else {
            return
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let response = try JSONDecoder().decode([RepositoryResponse].self, from: data)
        print("Decoded repository count: \(response.count)")
        print("Decoded repositories: \(response)")

        self.userRepo = RepositoriesMapper().map(input: response)
    }
}

#Preview {
    UserDetailView(user: GitHubUserNew(id: 1, login: "username", avatarUrl: "", name: "Name"))
}

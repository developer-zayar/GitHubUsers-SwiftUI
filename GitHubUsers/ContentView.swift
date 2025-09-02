//
//  ContentView.swift
//  GitHubUsers
//
//  Created by Zay Yar Phyo on 03/08/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading users...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else {
                    List(viewModel.gitHubUsers) { user in
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
                        }
                    }
                }
            }
            .navigationTitle("GitHub Users")
        }
        .task {
            await viewModel.getGitHubUsers()
        }
    }
}

#Preview {
    ContentView()
}

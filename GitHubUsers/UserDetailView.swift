//
//  UserDetailView.swift
//  GitHubUsers
//
//  Created by Zay Yar Phyo on 08/08/2025.
//

import SwiftUI

struct UserDetailView: View {
    let user: GitHubUser

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    AsyncImage(url: URL(string: user.imageUrl)) { image in
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

                    Text(user.username)
                        .font(.title)
                        .bold()

                    Text(user.name)
                        .font(.headline)

                    HStack {
                        Text("Followers: \(user.followers)")
                        Spacer()
                        Text("Following: \(user.following)")
                    }
                    .foregroundStyle(Color.gray)

                    Text("Repositories")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()

                    ForEach(user.repositories) { repository in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(repository.name)
                                .font(.headline)
                                .foregroundStyle(Color.blue)

                            HStack {
                                Text(repository.language)
                                    .font(.subheadline)

                                Spacer()

                                Image(systemName: "star.fill")
                                    .foregroundStyle(Color.gray)

                                Text("\(repository.stars)")
                            }

                            Text(repository.description)
                        }
                        .padding(.vertical)

                        Divider()
                    }
                }
                .padding()
            }
            .navigationTitle(user.username)
        }
    }
}

#Preview {
    UserDetailView(user: sampleUsers.first!)
}

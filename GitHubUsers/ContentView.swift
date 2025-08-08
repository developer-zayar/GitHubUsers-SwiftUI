//
//  ContentView.swift
//  GitHubUsers
//
//  Created by Zay Yar Phyo on 03/08/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(sampleUsers) { user in
                NavigationLink(destination: UserDetailView(user: user)) {
                    HStack {
                        AsyncImage(url: URL(string: user.imageUrl)) { image in
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

                        Text(user.username)
                            .font(.body)
                    }
//                    .padding()
                }
            }
            .navigationTitle("GitHub Users")
        }
    }
}

#Preview {
    ContentView()
}

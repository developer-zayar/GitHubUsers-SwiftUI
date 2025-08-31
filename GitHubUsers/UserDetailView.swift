//
//  UserDetailView.swift
//  GitHubUsers
//
//  Created by Zay Yar Phyo on 08/08/2025.
//

import SwiftUI

struct UserDetailView: View {
    @State var user: GitHubUser

    @StateObject var viewModel = ViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading details...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else {
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
                                Text("Followers: \(user.followers)")
                                Spacer()
                                Text("Following: \(user.following)")
                            }
                            .foregroundStyle(Color.gray)
                            
                            Text("Repositories")
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding()
                            
                            ForEach(viewModel.userRepositories) { repository in
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
                }
            }
            .navigationTitle(self.user.login)
            .task {
                await viewModel.getUserDetails(userId: user.login)
                if let userDetails = viewModel.userDetails {
                    self.user = userDetails
                }

                await viewModel.getUserRepositories(userId: user.login)
            }
        }
    }
}

#Preview {
    UserDetailView(
        user: GitHubUser(id: 1, login: "username", avatarUrl: "", name: "Name", followers: 0, following: 0)
    )
}

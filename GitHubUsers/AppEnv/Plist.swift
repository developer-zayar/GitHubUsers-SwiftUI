//
//  Plist.swift
//  GitHubUsers
//
//  Created by Zay Yar Phyo on 01/09/2025.
//

import Foundation

enum Plist {
    case baseUrl

    var value: String {
        switch self {
        case .baseUrl:
            return "Base URL"
        }
    }
}

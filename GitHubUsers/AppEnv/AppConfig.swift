//
//  AppConfig.swift
//  GitHubUsers
//
//  Created by Zay Yar Phyo on 01/09/2025.
//

import Foundation

enum AppConfig {
    static var baseUrl: String {
        return configuration(key: .baseUrl)
    }

    private static func configuration(key: Plist) -> String {
        if let infoDictionary = Bundle.main.infoDictionary {
            return infoDictionary[key.value] as? String ?? ""
        }
        fatalError("Unable to load plist file")
    }
}

//
//  PRResponseModel.swift
//  PR reviewer
//
//  Created by Faizan Memon on 05/10/22.
//

import Foundation

// MARK: - PRInfoResponseModel
struct PRInfoResponseModel: Decodable {
    let totalCount: Int?
    let items: [PRItem]?

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}

// MARK: - PRItem
struct PRItem: Decodable {
    let number: Int?
    let title: String
    let user: PRAssigneeInfo?
    let state: String?
    let createdAt, updatedAt, closedAt: String?
    let draft: Bool?
    let score: Int?

    enum CodingKeys: String, CodingKey {
        case number, title, user, state
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case closedAt = "closed_at"
        case draft
        case score
    }
}

// MARK: - AssigneeInfo
struct PRAssigneeInfo: Decodable {
    let avatarURL: String?

    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
    }
}

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
    let prDetail: PRDetail?

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
        case prDetail = "pull_request"
    }
}

// MARK: - PRItem
struct PRItem: Decodable {
    let number: Int?
    let title: String
    let user: PRAssigneeInfo?
    let state: PRState?
    let createdAt, updatedAt, closedAt: String?
    let isDraft: Bool?
    let score: Int?

    enum CodingKeys: String, CodingKey {
        case number, title, user, state
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case closedAt = "closed_at"
        case isDraft = "draft"
        case score
    }
}

// MARK: - AssigneeInfo
struct PRAssigneeInfo: Decodable {
    let handleName: String?
    let avatarURL: String?

    enum CodingKeys: String, CodingKey {
        case handleName = "login"
        case avatarURL = "avatar_url"
    }
}

struct PRDetail: Decodable {
    let mergedAt: String?

    enum CodingKeys: String, CodingKey {
        case mergedAt = "merged_at"
    }
}

enum PRState: String, Decodable {
    case open
    case closed
}

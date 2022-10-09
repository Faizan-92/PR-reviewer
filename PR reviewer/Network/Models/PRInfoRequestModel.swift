//
//  PRInfoRequestModel.swift
//  PR reviewer
//
//  Created by Faizan Memon on 09/10/22.
//

import Foundation

struct PRInfoRequestModel: Encodable {
    let pageNo: Int
    let pageSize: Int

    enum CodingKeys: String, CodingKey {
        case pageNo = "page"
        case pageSize = "per_page"
    }
}

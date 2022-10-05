//
//  GitService.swift
//  PR reviewer
//
//  Created by Faizan Memon on 05/10/22.
//

import Foundation
import Alamofire

enum GitServiceEndPoint: BaseServiceEndPoint {

    case fetchPRs(author: String)

    var endPoint: URL {
        return baseUrl.appendingPathComponent(path)
    }

    var path: String {
        switch self {
        case .fetchPRs:
            return "search/issues"
        }
    }

    var queryParams: String {
        switch self {
        case .fetchPRs(let author):
            let params: [String: String] = [
                "repo": AppConstants.repoName,
                "author": "\(author)",
                "is": "pr"
            ]
            return params.compactMap { $0 + ":" + $1 }.joined(separator: "+")
        }
    }

    var methodType: HTTPMethod {
        switch self {
        case .fetchPRs:
            return .get
        }
    }
}


final class GitService: BaseService {
    func fetchPRs(
        author: String,
        completionHandler: @escaping ((PRInfoResponseModel) -> Void)
    ) {
        let endPoint: GitServiceEndPoint = .fetchPRs(author: author)
        var url = endPoint.baseUrl.appendingPathComponent(endPoint.path).absoluteString + "?q="
        url += endPoint.queryParams
        callApi(
            urlString: url,
            method: endPoint.methodType,
            completionHandler: completionHandler
        )
    }
}

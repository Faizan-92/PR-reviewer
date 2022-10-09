//
//  GitService.swift
//  PR reviewer
//
//  Created by Faizan Memon on 05/10/22.
//

import Foundation
import Alamofire

enum GitServiceEndPoint: BaseServiceEndPoint {

    case fetchPRs(repoName: String)

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
        case .fetchPRs(let repoName):
            let params: [String: String] = [
                "repo": repoName,
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
    
    /// Fetches PR info for given repo on Github at a given page using Github backend.
    /// - Parameters:
    ///   - repoName: The name of repo who's PR details need to be fetched. e.g. Faizan-92/PR-reviewer
    ///   - requestModel: Request model containing page no and size of page
    ///   - completionHandler: closure that is triggered on successful api completion
    ///   - errorHandler: closure that is triggered if some error occurs in api.
    func fetchPRs(
        repoName: String,
        requestModel: PRInfoRequestModel,
        completionHandler: @escaping ((PRInfoResponseModel) -> Void),
        errorHandler: @escaping (() -> Void)
    ) {
        let endPoint: GitServiceEndPoint = .fetchPRs(repoName: repoName)
        var url = endPoint.baseUrl.appendingPathComponent(endPoint.path).absoluteString + "?q="
        url += endPoint.queryParams
        callApi(
            urlString: url,
            method: endPoint.methodType,
            parameters: requestModel.asDictionary(),
            completionHandler: completionHandler,
            errorHandler: { _ in
                errorHandler()
            }
        )
    }
}

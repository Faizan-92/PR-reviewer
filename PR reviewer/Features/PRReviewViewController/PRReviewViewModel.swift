//
//  ViewModel.swift
//  PR reviewer
//
//  Created by Faizan Memon on 05/10/22.
//

import Foundation

final class PRReviewViewModel {
    private let gitService: GitService
    private let pageSize: Int = 10
    private var totalPRs: Int = Int.max
    var dataSource: [PRItem] = []
    
    init(gitService: GitService) {
        self.gitService = gitService
    }

    func fetchPRsIfPossible(completionHandler: @escaping (([PRItem]) -> Void)) {
        // If all PRs are already fetched, then don't make API call
        guard totalPRs > dataSource.count else { return }

        let requestModel = PRInfoRequestModel(
            pageNo: (dataSource.count / pageSize) + 1,
            pageSize: pageSize
        )

        gitService.fetchPRs(
            repoName: AppConstants.repoName,
            requestModel: requestModel
        ) { [weak self] response in
            if let items = response.items, let totalPRs = response.totalCount {
                self?.totalPRs = totalPRs
                self?.dataSource.append(contentsOf: items)
                completionHandler(items)
            }
        }
    }
}

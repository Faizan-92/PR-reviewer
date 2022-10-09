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
    
    /// Fetches PR info from BE if all PRs are not fetched already. Page size of one fetch request is set to 10 right now.
    /// After fetching PR info, it inserts it to the data source. If all PRs are already fetched, no action is performed.
    /// - Parameter completionHandler: Closure that is executed after fetching next set of PRs from BE.
    /// Takes list of new PRs and index path where the new items need to be inserted.
    /// - Parameter errorHandler: Closure that needs to be executed if API failure occurs.
    func fetchPRsIfPossible(
        completionHandler: @escaping (([PRItem], Int) -> Void),
        errorHandler: @escaping(() -> Void)
    ) {
        // If all PRs are already fetched, then don't make API call
        guard totalPRs > dataSource.count else { return }

        let requestModel = PRInfoRequestModel(
            pageNo: (dataSource.count / pageSize) + 1,
            pageSize: pageSize
        )

        gitService.fetchPRs(
            repoName: AppConstants.repoName,
            requestModel: requestModel,
            completionHandler: { [weak self] value in
                if let items = value.items, let totalPRs = value.totalCount {
                    let indexToInsert = self?.dataSource.count ?? 0
                    self?.totalPRs = totalPRs
                    self?.dataSource.append(contentsOf: items)
                    completionHandler(items, indexToInsert)
                }
            },
            errorHandler: {
            errorHandler()
        })
    }
}

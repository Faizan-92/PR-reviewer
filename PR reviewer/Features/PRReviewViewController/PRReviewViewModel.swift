//
//  ViewModel.swift
//  PR reviewer
//
//  Created by Faizan Memon on 05/10/22.
//

import Foundation

final class PRReviewViewModel {
    private let gitService: GitService
    var dataSource: [PRItem] = []
    
    init(gitService: GitService) {
        self.gitService = gitService
    }

    func fetchPRs(completionHandler: @escaping (([PRItem]) -> Void)) {
        gitService.fetchPRs(repoName: AppConstants.repoName) { [weak self] response in
            if let items = response.items {
                self?.dataSource.append(contentsOf: items)
                completionHandler(items)
            }
        }
    }
}

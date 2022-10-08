//
//  ViewModel.swift
//  PR reviewer
//
//  Created by Faizan Memon on 05/10/22.
//

import Foundation

final class PRReviewViewModel {
    var gitService: GitService

    init(gitService: GitService) {
        self.gitService = gitService
    }

    func fetchPRs() {
        gitService.fetchPRs(repoName: AppConstants.repoName) { response in
            Logger.log("info: \(response)")
        }
    }
}

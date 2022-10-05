//
//  ViewModel.swift
//  PR reviewer
//
//  Created by Faizan Memon on 05/10/22.
//

import Foundation

final class PRReviewViewModel {
    let gitService = GitService()

    func fetchPRs(ofAuthor author: String) {
        gitService.fetchPRs(author: author) { response in
            Logger.log("info: \(response)")
        }
    }
}

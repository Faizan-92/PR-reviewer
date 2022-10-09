//
//  PRReviewViewController + TableView.swift
//  PR reviewer
//
//  Created by Faizan Memon on 08/10/22.
//

import Foundation
import UIKit

extension PRReviewViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // If we are on second last row, try to fetch more PRs info if possible
        if indexPath.row > viewModel.dataSource.count - 2 {
            fetchPRsIfPossible()
        }
    }
}

extension PRReviewViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: PRInfoTableViewCell.className,
            for: indexPath
        ) as! PRInfoTableViewCell

        let cellVM = PRInfoTableViewCellViewModel(
            item: viewModel.dataSource[indexPath.row]
        )

        cell.configureCell(viewModel: cellVM)
        return cell
    }
}

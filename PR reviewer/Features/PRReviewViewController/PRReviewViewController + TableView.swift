//
//  PRReviewViewController + TableView.swift
//  PR reviewer
//
//  Created by Faizan Memon on 08/10/22.
//

import Foundation
import UIKit

extension PRReviewViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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

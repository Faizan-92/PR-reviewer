//
//  PRInfoTableViewCell.swift
//  PR reviewer
//
//  Created by Faizan Memon on 08/10/22.
//

import Foundation
import UIKit

final class PRInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var createdDateLabel: UILabel!
    @IBOutlet weak var closedDateLabel: UILabel!
    @IBOutlet weak var profilePicImageView: UIImageView!
    @IBOutlet weak var userHandleLabel: UILabel!

    private var viewModel: PRInfoTableViewCellViewModel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }


    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func configureCell(viewModel: PRInfoTableViewCellViewModel) {
        self.viewModel = viewModel
        let item = viewModel.item
        titleLabel.text = item.title
        if let createdTime = item.createdAt {
            createdDateLabel.text = "Created at: " + createdTime
        }
        if let closedTime = item.closedAt {
            // TODO: handle unclosed PR scenarios
            closedDateLabel.text = "Closed at: " + closedTime
        }
        handlePRState(item.state)
        userHandleLabel.text = item.user?.handleName
    }

    private func handlePRState(_ state: PRState?) {
        guard let state = state else { return }
        switch state {
        case .closed:
            break // TODO: handle apt statusImageView here
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        statusImageView = nil
        titleLabel.text = nil
        createdDateLabel.text = nil
        closedDateLabel.text = nil
        profilePicImageView.image = nil
        userHandleLabel.text = nil
    }
}

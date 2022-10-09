//
//  PRInfoTableViewCell.swift
//  PR reviewer
//
//  Created by Faizan Memon on 08/10/22.
//

import Foundation
import UIKit
import SDWebImage

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
        handlePRState(item: item)
        userHandleLabel.text = item.user?.handleName
        profilePicImageView.sd_setImage(with: URL(string: item.user?.avatarURL ?? ""))
    }

    private func handlePRState(item: PRItem?) {
        guard let item = item,
              let isDraftPR = item.isDraft,
              var state = item.state
        else { return }

        if isDraftPR {
            state = .draft
        }

        switch state {
        case .closed:
            let isPRClosed = (item.detail?.mergedAt == nil)
            let icon: IconAsset = isPRClosed ? .prClosed : .prMerged
            if isPRClosed {
                statusImageView.image = icon.originalImage
            } else {
                statusImageView.image = icon.templateImage?.sd_tintedImage(with: .purple)
            }
        case .open:
            statusImageView.image = IconAsset.prOpen.originalImage
            closedDateLabel.isHidden = true
        case .draft:
            statusImageView.image = IconAsset.prDraft.originalImage
            closedDateLabel.isHidden = true
        }

        if let createdTime = item.createdAt {
            createdDateLabel.text = "Created at: " + createdTime
        }
        if let closedTime = item.closedAt {
            closedDateLabel.text = "Closed at: " + closedTime
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        statusImageView.image = nil
        titleLabel.text = nil
        createdDateLabel.text = nil
        closedDateLabel.text = nil
        profilePicImageView.image = nil
        userHandleLabel.text = nil
    }
}

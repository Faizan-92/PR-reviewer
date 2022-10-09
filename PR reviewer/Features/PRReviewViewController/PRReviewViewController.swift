//
//  ViewController.swift
//  PR reviewer
//
//  Created by Faizan Memon on 05/10/22.
//

import UIKit

final class PRReviewViewController: UIViewController {

    @IBOutlet weak var prTableView: UITableView!

    let viewModel = PRReviewViewModel(gitService: GitService())

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setDelegates()
        addPRsIfPossible()
    }

    private func registerCells() {
        prTableView.register(
            UINib(nibName: PRInfoTableViewCell.className, bundle: nil),
            forCellReuseIdentifier: PRInfoTableViewCell.className
        )
    }

    private func setDelegates() {
        prTableView.delegate = self
        prTableView.dataSource = self
    }
    
    /// fetches more PR info if all the PRs are not fetched already. Once it fetches info from BE, it will also insert it to
    /// tableview using batch updates. Also, this insertion is done without any animation.
    func addPRsIfPossible() {
        viewModel.fetchPRsIfPossible(
            completionHandler: { [weak self] newItems, indexToInsert in
                self?.handleNewItems(newItems, indexToInsert)
            },
            errorHandler: { [weak self] in
                self?.showToast(
                    message: ErrorMessage.somethingWentWrong.rawValue,
                    font: .systemFont(ofSize: 15)
                )
            })
    }

    private func handleNewItems(_ newItems: [PRItem], _ indexToInsert: Int) {
        // if no PRs are found, handle zero state.
        if newItems.isEmpty && indexToInsert == 0 {
            showToast(
                message: ErrorMessage.noPRsFound.rawValue,
                font: .systemFont(ofSize: 15),
                duration: .greatestFiniteMagnitude
            )
            return
        }

        UIView.performWithoutAnimation {
            prTableView.performBatchUpdates({
                let rangeToInsert = indexToInsert..<indexToInsert + newItems.count
                let indexPaths = rangeToInsert.map { IndexPath(row: $0, section: 0) }
                prTableView.insertRows(at: indexPaths, with: .none)
            })
        }
    }
}

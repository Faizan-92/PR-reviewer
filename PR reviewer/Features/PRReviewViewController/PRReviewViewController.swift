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
        fetchPRs()
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

    private func fetchPRs() {
        viewModel.fetchPRs { [weak self] newItems in
            self?.prTableView.reloadData() // TODO: update with batch updates
        }
    }
}

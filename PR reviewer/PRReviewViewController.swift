//
//  ViewController.swift
//  PR reviewer
//
//  Created by Faizan Memon on 05/10/22.
//

import UIKit

class PRReviewViewController: UIViewController {
    private let viewModel = PRReviewViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchPRs(ofAuthor: "Faizan-92")
    }
}


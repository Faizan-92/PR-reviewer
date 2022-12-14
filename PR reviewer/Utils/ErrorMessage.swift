//
//  ErrorMessage.swift
//  PR reviewer
//
//  Created by Faizan Memon on 09/10/22.
//

import Foundation

enum ErrorMessage: String {
    case somethingWentWrong = "Something went wrong."
    case tryLater = "Please try again later."
    case noPRsFound = "No PRs found. Are you sure repo name is correct ?"
}

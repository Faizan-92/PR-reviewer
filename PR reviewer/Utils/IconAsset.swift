//
//  IconAsset.swift
//  PR reviewer
//
//  Created by Faizan Memon on 08/10/22.
//

import Foundation
import UIKit

public enum IconAsset: String {
    case prOpen = "ic_pr_open"
    case prMerged = "ic_pr_merged"
    case prClosed = "ic_pr_closed"
    case prDraft = "ic_pr_draft"

    public var templateImage: UIImage? {
        return UIImage(named: self.rawValue, in: Bundle.main, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate)
    }

    public var originalImage: UIImage? {
        return UIImage(named: self.rawValue, in: Bundle.main, compatibleWith: nil)?.withRenderingMode(.alwaysOriginal)
    }
}

//
//  NSObject + Extensions.swift
//  PR reviewer
//
//  Created by Faizan Memon on 08/10/22.
//

import Foundation

public extension NSObject {

    var className: String {
        return "\(self)"
    }

    static var className: String {
        return "\(self)"
    }
}

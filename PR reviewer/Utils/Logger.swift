//
//  Logger.swift
//  PR reviewer
//
//  Created by Faizan Memon on 05/10/22.
//

import Foundation

final class Logger {
    static func log(_ text: String?) {
        #if DEBUG
        print(text ?? "nil")
        #endif
    }
}

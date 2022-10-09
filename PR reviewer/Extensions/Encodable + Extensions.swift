//
//  Encodable + Extensions.swift
//  PR reviewer
//
//  Created by Faizan Memon on 09/10/22.
//

import Foundation

extension Encodable {
  func asDictionary() -> [String: Any] {
    
    guard let data = try? JSONEncoder().encode(self),
        let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
        Logger.log("failed to convert encodable to dictionary")
        return [:]
    }
    return dictionary
  }
}

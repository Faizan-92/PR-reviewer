//
//  BaseServiceEndPoint.swift
//  PR reviewer
//
//  Created by Faizan Memon on 05/10/22.
//

import Foundation
import Alamofire

protocol BaseServiceEndPoint {
    var baseUrl: URL { get }
    var queryParams: [String: String] { get }
    var path: String { get }
    var methodType: HTTPMethod { get }
}

extension BaseServiceEndPoint {
    var baseUrl: URL {
        return URL(string: "https://api.github.com")!
    }

    var queryParams: [String: String] {
        return [:]
    }
}

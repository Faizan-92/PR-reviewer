//
//  UnitTestHelper.swift
//  PR reviewerTests
//
//  Created by Faizan Memon on 09/10/22.
//

import Foundation

final class UnitTestHelper {

    static let shared = UnitTestHelper()

    func getDataFromMockResponse(fileName: String) -> Data {
        let testBundle = Bundle(for: type(of: self))
        if let path = testBundle.path(forResource: fileName, ofType: "json") {
            do {
                return try Data(contentsOf: URL(fileURLWithPath: path))
            } catch {
                return Data()
            }
        }
        return Data()
    }
}

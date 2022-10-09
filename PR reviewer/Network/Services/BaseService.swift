//
//  BaseService.swift
//  PR reviewer
//
//  Created by Faizan Memon on 05/10/22.
//

import Foundation
import Alamofire

class BaseService {
    
    /// Calls API using params and logs request and response objects to console for debugging. Also validates the response
    /// using status code
    /// - Parameters:
    ///   - urlString: string to be used as base url
    ///   - method: REST method type. e.g. get, put, post, delete, patch, etc.
    ///   - parameters: The query params to be appended to base urlString
    ///   - completionHandler: Completion handler for successful API completion
    ///   - errorHandler: Closure to handle error in API response
    func callApi<T: Decodable>(
        urlString: String,
        method: HTTPMethod,
        parameters: Parameters? = nil,
        completionHandler: @escaping((T) -> Void),
        errorHandler: @escaping((AFError) -> Void)
    ) {
        let request = AF.request(
            urlString,
            method: method,
            parameters: parameters
        )
        .debug()
        .validate()
        .responseDecodable(of: T.self) { response in
            Logger.log(response.value.debugDescription)
            if let value = response.value {
                completionHandler(value)
            } else if let error = response.error {
                errorHandler(error)
            }
        }
        Logger.log(request.description)
    }
}

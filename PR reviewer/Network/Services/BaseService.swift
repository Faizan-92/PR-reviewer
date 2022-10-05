//
//  BaseService.swift
//  PR reviewer
//
//  Created by Faizan Memon on 05/10/22.
//

import Foundation
import Alamofire

class BaseService {
    func callApi<T: Decodable>(
        endPoint: BaseServiceEndPoint,
        completionHandler: @escaping((T) -> Void)
    ) {
        AF.request(
            endPoint.baseUrl.appendingPathComponent(endPoint.path),
            method: endPoint.methodType,
            parameters: endPoint.queryParams
        )
        .debug()
        .validate()
        .responseDecodable(of: T.self) { response in
            Logger.log(response.value.debugDescription)
            if let value = response.value {
                completionHandler(value)
            }
        }
    }

    func callApi<T: Decodable>(
        urlString: String,
        method: HTTPMethod,
        parameters: Parameters? = nil,
        completionHandler: @escaping((T) -> Void)
    ) {
        AF.request(
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
            }
        }
    }
}

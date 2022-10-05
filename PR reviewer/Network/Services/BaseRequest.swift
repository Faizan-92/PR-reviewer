//
//  BaseRequest.swift
//  PR reviewer
//
//  Created by Faizan Memon on 05/10/22.
//

import Foundation
import Alamofire

extension Request {
   public func debug() -> Self {
       Logger.log(self.description)
       return self
   }
}

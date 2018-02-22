//
//  APIManager.swift
//  netronixgroup_test
//
//  Created by Roman Resenchuk on 22/02/2018.
//  Copyright © 2018 Roman Resenchuk. All rights reserved.
//

import UIKit
import Alamofire

class APIManager: NSObject {
    
    static let shared = APIManager()
    
    // Basic request for reading stream
    func requestStream(parameters: Parameters,
                 encoding: ParameterEncoding,
                 headers: HTTPHeaders,
                 method: HTTPMethod,
                 path: String,
                 completionHandler: @escaping (Any) -> Void) {
        
        Alamofire.request(path, method: method, parameters: parameters, encoding: encoding, headers: headers).stream { (streamResponse) in
            completionHandler(streamResponse)
        }
    }
}

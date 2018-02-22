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
                       successHandler: @escaping (Any) -> Void,
                       errorHandler: @escaping (Any) -> Void) {
        let request = Alamofire.request(path, method: method, parameters: parameters, encoding: encoding, headers: headers)
        request.stream { (streamResponse) in
            
            successHandler(streamResponse)
        }
        request.responseData { response in
            switch response.result {
            case .success:
                print("stream end successful")
            case .failure(let error):
                print(error)
                errorHandler(error)
            }
        }
        
    }
}

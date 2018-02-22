//
//  APIManager+Methods.swift
//  netronixgroup_test
//
//  Created by Roman Resenchuk on 22/02/2018.
//  Copyright © 2018 Roman Resenchuk. All rights reserved.
//

import Alamofire

private let kURLAPI = "https://jsdemo.envdev.io/"
private let kSsePath = "sse"

extension APIManager {
    
    func sseRequest(parameters: [String : Any],
                    completionHandler: @escaping (Any) -> Void) {
        requestStream(parameters: parameters,
                      encoding: URLEncoding.default,
                      headers: [:],
                      method: .get,
                      path: kURLAPI + kSsePath) { (response) in
                        
                        let utf8Text = String(data: response as! Data, encoding: .utf8)
                        print(utf8Text)
        }
    }
}

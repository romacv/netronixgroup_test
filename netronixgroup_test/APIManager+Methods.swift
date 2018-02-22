//
//  APIManager+Methods.swift
//  netronixgroup_test
//
//  Created by Roman Resenchuk on 22/02/2018.
//  Copyright © 2018 Roman Resenchuk. All rights reserved.
//

import Alamofire
import SwiftyJSON

private let kURLAPI = "https://jsdemo.envdev.io/"
private let kSsePath = "sse"

extension APIManager {
    
    func sseRequest(parameters: [String : Any],
                    successHandler: @escaping (Any) -> Void,
                    errorHandler: @escaping (Any) -> Void) {
        
        requestStream(parameters: parameters,
                      encoding: URLEncoding.default,
                      headers: [:],
                      method: .get,
                      path: kURLAPI + kSsePath,
                      successHandler:  { (response) in
                        
                        let utf8Text = String(data: response as! Data, encoding: .utf8)
                        let clearJsonString = utf8Text?.replacingOccurrences(of: "data: ", with: "")
                        let jsonData = (clearJsonString?.data(using: String.Encoding.utf8))!
                        do {
                            let json = try JSON(data: jsonData)
                            print(json)
                            successHandler(json)
                            return
                        }
                            
                        catch {
                            errorHandler(NSError(domain:String(describing: self), code:0, userInfo:["Error parsing json" : "Error parsing json"]))
                        }
                        
        }, errorHandler: { (error) in
            errorHandler(error)
        })
    }
}

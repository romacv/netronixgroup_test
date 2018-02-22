//
//  Event.swift
//  netronixgroup_test
//
//  Created by Roman Resenchuk on 22/02/2018.
//  Copyright © 2018 Roman Resenchuk. All rights reserved.
//

import SwiftyJSON

struct Event {
    
    var _id : String?
    var measurements : Array<Array<Measurement>> = []
    var name : String?
    var unit : String?
    
    mutating func mapping(json: SwiftyJSON.JSON) {
        _id = json["_id"].string
        measurements = []
        for measurmentItem in json["measurements"].arrayValue {
            var measurement = Measurement.init()
            measurement.mapping(json: measurmentItem)
            measurements.append([measurement])
        }
        name = json["name"].string
        unit = json["unit"].string
    }
    
    struct Measurement {
        var measurementValue: Array<String> = []
        mutating func mapping(json: SwiftyJSON.JSON) {
            measurementValue = []
            for measurementValueItem in json.arrayValue {
                measurementValue.append(String.init(describing: measurementValueItem.object))
            }
        }
    }
    
}

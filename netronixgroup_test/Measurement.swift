//
//  Measurement.swift
//  netronixgroup_test
//
//  Created by Roman Resenchuk on 22/02/2018.
//  Copyright © 2018 Roman Resenchuk. All rights reserved.
//

import UIKit

struct Measurement: Decodable {
    
    let _id : String?
    //let measurements : Array<Array<MeasurementsValue>>?
    let name : String?
    //let unit : String?
    
    struct MeasurementsValue: Decodable {
        
         
    }
}

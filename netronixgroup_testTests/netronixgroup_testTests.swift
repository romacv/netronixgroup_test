//
//  netronixgroup_testTests.swift
//  netronixgroup_testTests
//
//  Created by Roman Resenchuk on 22/02/2018.
//  Copyright © 2018 Roman Resenchuk. All rights reserved.
//

import XCTest
@testable import netronixgroup_test
@testable import SwiftyJSON

class netronixgroup_testTests: XCTestCase {
    
    var event: Event!
    
    override func setUp() {
        super.setUp()
        event = Event()
    }
    
    override func tearDown() {
        super.tearDown()
        event = nil
    }
    
    // MARK: Tests func
    func testEventDataGoodStructure() {
        // With perfect JSON model response
        let json: JSON =  ["name":"Temperature","unit":"â„ƒ","measurements":[[1519460317,5.043124756498185]],"_id":"5a911fdd21f2b200014a4683"]
        checkEventModel(json: json)
    }
    func testEventDataNoMeasurements() {
        // JSON model response missing Measurements array
        let json: JSON =  ["name":"Pressure","unit":"hPa","measurements":[],"_id":"5a911fdc21f2b200014a4601"]
        checkEventModel(json: json)
    }
    func testEventDataWithoutUnit() {
        // Test with JSON model response missing Unit value
        let json: JSON =  ["name":"Serial","measurements":[[1519460312,"0B100100"],[1519460313,"0B100100"],[1519460314,"0B100100"],[1519460315,"0B100100"],[1519460316,"0B100100"]],"_id":"5a911fdc21f2b200014a4602"]
        checkEventModel(json: json)
    }
    
    func checkEventModel(json: JSON) {
        
        event.mapping(json: json)
        XCTAssertNotNil(event._id)
        XCTAssert(event.measurements.count > 0)
        XCTAssertNotNil(event.name)
        XCTAssertNotNil(event.unit)
    }
    
}

//
//  PTJenkinsCITests.swift
//  PTJenkinsCITests
//
//  Created by Phạm Xuân Tiến on 6/12/19.
//  Copyright © 2019 Sun*. All rights reserved.
//

import XCTest
@testable import PTJenkinsCI

class PTJenkinsCITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample01() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(4, 4)
    }
    
    func testExample02() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(4, 8)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

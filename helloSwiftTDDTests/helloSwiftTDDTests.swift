//
//  helloSwiftTDDTests.swift
//  helloSwiftTDDTests
//
//  Created by Norman Sutorius on 06.01.17.
//  Copyright © 2017 Norman Sutorius. All rights reserved.
//

import XCTest
@testable import helloSwiftTDD

class SimpleHelloTest: XCTestCase {
    
    
    let helloUnderTest = SimpleHello()
    
    func testPublicMessage() {
        
        XCTAssertEqual("Hello Developers outhere!", helloUnderTest.message())
    }
    
}

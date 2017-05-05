//
//  TestHttpClient.swift
//  helloSwiftTDD
//
//  Created by Norman Sutorius on 08.01.17.
//  Copyright © 2017 Norman Sutorius. All rights reserved.
//

import XCTest
@testable import helloSwiftTDD

class TestHttpClient: XCTestCase {
    
    var client: NOSUHttpClient!
    let session = FakeURLSession()
    
    // Run before the test
    override func setUp() {
        super.setUp()
        // add the fake session
        client = NOSUHttpClient(session: session)
    }
        
    // Test Data
    func test_GET_data() {
        
        //test setup
        let url = NSURL(string: "https://console.ng.bluemix.net")!
        let expectedData = "{event: 'cool keynote'}".data(using: String.Encoding.utf8) as NSData?
        session.nextData = expectedData
        session.nextResponse = HTTPURLResponse(url: url as URL, statusCode: 200, httpVersion: nil, headerFields: nil)
        var data: NSData?
        
        // this is how the client should work
        client.setupEndpoint(url: url)
        data = client.get()
        
        // Accepatance and expectaion what the client provides
        XCTAssert(session.lastURL === url, "the url should be exact the same like in the get func!")
        XCTAssertNotNil(data, "Data should have to be not nil!")
        XCTAssertEqual(data, expectedData, "Get should provide the fake data.")

    }
}

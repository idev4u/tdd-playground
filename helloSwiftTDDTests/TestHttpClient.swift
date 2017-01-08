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
    
    var client: HTTPAPIController!
    let session = FakeURLSession()
    
    override func setUp() {
        super.setUp()
        client = HTTPAPIController(session: session)
    }
    
    func test_fake_connection() {
        let url = NSURL(string: "https://console.ng.bluemix.net")!
        
        //second arg is closure funny syntax
        client.get(url: url) { (_, _) -> Void in }
    
        XCTAssert(session.lastURL === url)
    }
    
    func test_GET_StartsTheRequest() {
        let dataTask = FakeURLSessionDataTask()
        session.nextDataTask = dataTask
        
        client.get(url: NSURL()) { (_, _) -> Void in }
        
        XCTAssert(dataTask.resumeWasCalled)
    }
    
    // Test Data
    func test_GET_data() {
        
        //test setup
        let url = NSURL(string: "https://console.ng.bluemix.net")!
        let expectedData = "{event: 'cool keynote'}".data(using: String.Encoding.utf8) as NSData?
        session.nextData = expectedData
        session.nextResponse = HTTPURLResponse(url: url as URL, statusCode: 200, httpVersion: nil, headerFields: nil)

        // how to us it
        var data: NSData?
        client.get(url: url) { (receivedData, _) -> Void in
            data = receivedData
        }
        
        //Control your requirements
        XCTAssert(session.lastURL === url, "the url should be exact the same like in the get func!")
        XCTAssertNotNil(data, "Data should have to be not nil!")
        XCTAssertEqual(data, expectedData, "Get should provide the fake data.")

    }
}

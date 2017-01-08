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
    
    var client: HTTPClient!
    let session = FakeURLSession()
    
    override func setUp() {
        super.setUp()
        client = HTTPClient(session: session)
    }
    
    func test_fake_connection() {
        let url = NSURL(string: "https://console.ng.bluemix.net")!
    
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
        
        
        let url = NSURL(string: "https://console.ng.bluemix.net")!
        let expectedData = "{event: 'cool keynote'}".data(using: String.Encoding.utf8) as NSData?
        session.nextData = expectedData

        var data: NSData?
        session.nextResponse = HTTPURLResponse(url: url as URL, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        // simple test fake test Facade
        client.get(url: url) { (receivedData, _) -> Void in
            data = receivedData

        }

        XCTAssertNotNil(data)
        XCTAssertEqual(data, expectedData)

    }
}

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

}

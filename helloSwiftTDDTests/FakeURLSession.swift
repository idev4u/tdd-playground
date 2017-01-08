//
//  FakeURLSession.swift
//  helloSwiftTDD
//
//  Created by Norman Sutorius on 08.01.17.
//  Copyright © 2017 Norman Sutorius. All rights reserved.
//

import Foundation
@testable import helloSwiftTDD

class FakeURLSession: URLSessionProtocol {
    var nextDataTask = FakeURLSessionDataTask()
    var nextData: NSData?
    var nextResponse: URLResponse?
    var nextError: NSError?
    
    private (set) var lastURL: NSURL?
    
    func dataTaskWithURL(url: NSURL, completionHandler: DataTaskResult) ->URLSessionDataTaskProtocol {
        lastURL = url
        completionHandler(nextData, nextResponse, nextError)
        return nextDataTask
    }
      
}

class FakeURLSessionDataTask: URLSessionDataTaskProtocol {
    private (set) var resumeWasCalled = false
    
    func resume() {
        resumeWasCalled = true
    }
}

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
    private (set) var lastURL: NSURL?
    
    func dataTaskWithURL(url: NSURL, complitionHandler: DataTaskResult) ->URLSessionDataTask {
        lastURL = url
        return URLSessionDataTask()
    }
}

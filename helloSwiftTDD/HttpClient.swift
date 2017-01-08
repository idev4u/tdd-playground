//
//  HttpClient.swift
//  helloSwiftTDD
//
//  Created by Norman Sutorius on 08.01.17.
//  Copyright © 2017 Norman Sutorius. All rights reserved.
//

import Foundation

typealias HTTPResult = (NSData?, Error?) -> Void

class HTTPClient {
    
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func get(url: NSURL, completion: HTTPResult) {
        let task = session.dataTaskWithURL(url: url) { (_, _, _) -> Void in }
//        task.resume()
    }
}

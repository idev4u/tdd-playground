//
//  HttpClient.swift
//  helloSwiftTDD
//
//  Created by Norman Sutorius on 08.01.17.
//  Copyright © 2017 Norman Sutorius. All rights reserved.
//

import Foundation

typealias HTTPResult = (NSData?, Error?) -> Void

class HTTPAPIController {
    
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func get(url: NSURL, completion: HTTPResult) {
        /* Closure has no return type "void in
         { (parameters) -> return type in
         statements
         }
         */
        let task = session.dataTaskWithURL(url: url) { (data, response, error) -> Void in
            if let _ = error {
                completion(nil, error)
            } else if let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                // call the comletion call back
                completion(data, nil)
            } else {
                completion(nil, error)
            }
        }
        // init the request call
        task.resume()
    }
}

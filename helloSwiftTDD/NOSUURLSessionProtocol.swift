//
//  URLSessionProtol.swift
//  helloSwiftTDD
//
//  Created by Norman Sutorius on 08.01.17.
//  Copyright © 2017 Norman Sutorius. All rights reserved.
//

// Extends the Foundation URLSession

import Foundation

// predifend completionHandler
typealias DataTaskResult = (NSData?, URLResponse?, NSError?) ->Void

protocol NOSUURLSessionProtocol {
    
    func dataTaskWithURL(url: NSURL, completionHandler: DataTaskResult) -> NOSUURLSessionDataTaskProtocol
}

extension URLSession: NOSUURLSessionProtocol {
    // neccesssary to use the custom return type NOSUURLSessionDataTaskProtocol
    func dataTaskWithURL(url: NSURL, completionHandler : DataTaskResult) -> NOSUURLSessionDataTaskProtocol {
        return (dataTaskWithURL(url: url, completionHandler: completionHandler) as! URLSessionDataTask) as NOSUURLSessionDataTaskProtocol
    }
    
}

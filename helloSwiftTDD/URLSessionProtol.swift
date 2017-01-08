//
//  URLSessionProtol.swift
//  helloSwiftTDD
//
//  Created by Norman Sutorius on 08.01.17.
//  Copyright © 2017 Norman Sutorius. All rights reserved.
//
import Foundation

typealias DataTaskResult = (NSData?, URLResponse?, NSError?) ->Void

protocol URLSessionProtocol {
    
    func dataTaskWithURL(url: NSURL, complitionHandler: DataTaskResult) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {
    internal func dataTaskWithURL(url: NSURL, complitionHandler completionHandler: DataTaskResult) -> URLSessionDataTask {
        return (dataTaskWithURL(url: url, complitionHandler: completionHandler) as URLSessionDataTask)
    }
    
}

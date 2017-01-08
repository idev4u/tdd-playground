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
    
    func dataTaskWithURL(url: NSURL, completionHandler: DataTaskResult) -> URLSessionDataTaskProtocol
}

extension URLSession: URLSessionProtocol {
    func dataTaskWithURL(url: NSURL, completionHandler : DataTaskResult) -> URLSessionDataTaskProtocol {
        return (dataTaskWithURL(url: url, completionHandler: completionHandler) as! URLSessionDataTask) as URLSessionDataTaskProtocol
    }

}

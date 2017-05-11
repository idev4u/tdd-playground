//
//  URLSessionDataTaskProtocol.swift
//  helloSwiftTDD
//
//  Created by Norman Sutorius on 08.01.17.
//  Copyright © 2017 Norman Sutorius. All rights reserved.
//

// Extends the Foundation URLSessionDataTask

import Foundation

protocol NOSUURLSessionDataTaskProtocol {
    
    func resume()
    
}

extension URLSessionDataTask: NOSUURLSessionDataTaskProtocol {
    
}

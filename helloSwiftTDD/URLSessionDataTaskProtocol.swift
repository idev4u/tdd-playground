//
//  URLSessionDataTaskProtocol.swift
//  helloSwiftTDD
//
//  Created by Norman Sutorius on 08.01.17.
//  Copyright © 2017 Norman Sutorius. All rights reserved.
//

import Foundation

protocol URLSessionDataTaskProtocol {
    
    func resume()

}

extension URLSessionDataTask: URLSessionDataTaskProtocol { }

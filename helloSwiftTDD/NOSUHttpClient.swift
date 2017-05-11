//
//  HttpClient.swift
//  helloSwiftTDD
//
//  Created by Norman Sutorius on 08.01.17.
//  Copyright © 2017 Norman Sutorius. All rights reserved.
//

import Foundation

class NOSUHttpClient {
    
    private let session: NOSUURLSessionProtocol
    private var url: NSURL? = nil
    
    init(session: NOSUURLSessionProtocol = URLSession.shared) {
        self.session = session
        
    }
    
    func setupEndpoint(url: NSURL) {
        self.url = url
    }
    
    func get() -> NSData {
        var responseData = NSData()
        let task = session.dataTaskWithURL(url: url!) { (data, response, error) -> Void in
            if let _ = error {
                print("\(String(describing: error))")
            } else if let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                // add the data from the complition hanlder
                responseData = data!
            } else {
                print("\(String(describing: error))")
            }
        }
        task.resume()
        
        return responseData
    }
    

}

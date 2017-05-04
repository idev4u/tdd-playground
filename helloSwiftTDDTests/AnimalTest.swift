//
//  AnimalTest.swift
//  helloSwiftTDD
//
//  Created by Norman Sutorius on 06.01.17.
//  Copyright © 2017 Norman Sutorius. All rights reserved.
//

import XCTest
@testable import helloSwiftTDD

class AnimalTest: XCTestCase {
    
    
    func test2DifferentAnimals() {
        
        let donald: Animal = Duck()
        let duckFeature = donald.feature()
        XCTAssertEqual(duckFeature, "quak")
        
        let micky: Animal = Mouse()
        let mouseFeature = micky.feature()
        XCTAssertEqual(mouseFeature, "piep")
        
    }

}

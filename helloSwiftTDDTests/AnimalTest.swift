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
        
        let donald = Duck()
        let duckFeature = donald.feature()
        XCTAssertEqual(duckFeature, "quak")
        
        XCTAssertTrue(donald is Animal, "Expect that Donald is an Animal")
        
        let micky = Mouse()
        let mouseFeature = micky.feature()
        XCTAssertEqual(mouseFeature, "piep")
        
        XCTAssertTrue(micky is Animal, "Expect that Micky is an Animal")
        
        
    }

}

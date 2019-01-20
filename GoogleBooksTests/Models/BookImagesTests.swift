//
//  BookImagesTests.swift
//  GoogleBooksTests
//
//  Created by Vo Tung on 19/01/2019.
//  Copyright © 2019 Vo Tung. All rights reserved.
//

import XCTest
import Nimble
@testable import GoogleBooks

class BookImagesTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMappingBookImagesFromDictionaries() {
        let smallThumbnail = "link1"
        let thumbnail = "link2"
        let small = "link3"
        let medium = "link4"
        let large = "link5"
        let extraLarge = "link6"
        
        let dictionary = [
            "smallThumbnail": smallThumbnail,
            "thumbnail": thumbnail,
            "small": small,
            "medium": medium,
            "large": large,
            "extraLarge": extraLarge
        ]
        
        let images = BookImages(dictionary: dictionary)
        
        expect(images).toNot(beNil(), description: "BookImages must not be nil.")
        expect(images?.smallThumbnail).to(equal(smallThumbnail), description: "smallThumbnail link is incorrect.")
        expect(images?.thumbnail).to(equal(thumbnail), description: "thumbnail link is incorrect.")
    }
    
    func testMappingBookImagesFromIncorrectDictionaries() {
        let smallThumbnail = "link1"
        
        let dictionary = [
            "smallThumbnail": smallThumbnail,
        ]
        
        let images = BookImages(dictionary: dictionary)
        expect(images).to(beNil(), description: "BookImages must be nil.")
    }

}

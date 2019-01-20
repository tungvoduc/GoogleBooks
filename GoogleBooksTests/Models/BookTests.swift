//
//  BookTests.swift
//  GoogleBooksTests
//
//  Created by Vo Tung on 19/01/2019.
//  Copyright © 2019 Vo Tung. All rights reserved.
//

import XCTest
import Nimble
@testable import GoogleBooks

class BookTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMappingBooksFromDictionaries() {
        let id = "zyTCAlFPjgYC"
        let title = "The Google story"
        let description = "Description 1"
        let authors = [
            "David A. Vise",
            "Mark Malseed"
        ]
        var dictionary: [String : Any] = [
            "id": id,
            "volumeInfo": [
                "title": title,
                "authors": authors,
                "description": description,
                "imageLinks": bookImageLinks()
            ]
        ]
        
        // Full info
        var book = Book(dictionary: dictionary)
        expect(book).toNot(beNil())
        expect(book?.id).to(equal(id), description: "Book id is incorrect.")
        expect(book?.title).to(equal(title), description: "Book title is incorrect.")
        expect(book?.description).to(equal(description), description: "Book description is incorrect.")
        expect(book?.authors).to(equal(authors), description: "Book title incorrect.")
        
        let images = BookImages(dictionary: bookImageLinks())
        expect(book?.images).to(equal(images), description: "Book images is incorrect.")
        
        // Missing parts
        // Missing id
        dictionary = [
            "volumeInfo": [
                "title": title,
                "authors": authors,
                "description": description,
                "imageLinks": bookImageLinks()
            ]
        ]
        book = Book(dictionary: dictionary)
        expect(book).to(beNil())
        
        // Missing volumeInfo
        dictionary = [:]
        book = Book(dictionary: dictionary)
        expect(book).to(beNil())
        
        // Missing description
        dictionary = [
            "id": id,
            "volumeInfo": [
                "title": title,
                "authors": authors,
                "imageLinks": bookImageLinks()
            ]
        ]
        book = Book(dictionary: dictionary)
        expect(book).to(beNil())
        
        // Missing imageLinks
        dictionary = [
            "id": id,
            "volumeInfo": [
                "title": title,
                "authors": authors,
                "description": description,
            ]
        ]
        book = Book(dictionary: dictionary)
        expect(book).to(beNil())
        
        // Missing title
        dictionary = [
            "id": id,
            "volumeInfo": [
                "authors": authors,
                "description": description,
                "imageLinks": bookImageLinks()
            ]
        ]
        book = Book(dictionary: dictionary)
        expect(book).to(beNil())
    }
    
    private func bookImageLinks() -> [String: String] {
        return [
            "smallThumbnail": "https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
            "thumbnail": "https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
            "small": "https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=2&edge=curl&source=gbs_api",
            "medium": "https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=3&edge=curl&source=gbs_api",
            "large": "https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=4&edge=curl&source=gbs_api",
            "extraLarge": "https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=6&edge=curl&source=gbs_api"
        ]
    }

}

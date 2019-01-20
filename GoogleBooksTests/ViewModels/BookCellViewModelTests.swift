//
//  BookCellViewModelTests.swift
//  GoogleBooksTests
//
//  Created by Vo Tung on 19/01/2019.
//  Copyright © 2019 Vo Tung. All rights reserved.
//

import XCTest
import Nimble
@testable import GoogleBooks

class BookCellViewModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGenerateViewModelFromBook() {
        let book = Book(id: "123adsf", title: "Example 1", description: "This is the best book", authors: ["author1", "author2"], images: BookImages(smallThumbnail: "Link 1", thumbnail: "Link 2"))
        testGenerateViewModel(from: book)
    }
    
    func testGenerateViewModelFromBookWithNoAuthors() {
        let book = Book(id: "123adsf", title: "Example 1", description: "This is the best book", authors: [], images: BookImages(smallThumbnail: "Link 1", thumbnail: "Link 2"))
        testGenerateViewModel(from: book)
    }
    
    private func testGenerateViewModel(from book: Book) {
        let viewModel = BookCellViewModel(book: book)
        
        expect(viewModel.title).to(equal(book.title), description: "BookSearchViewModel's title is incorrect")
        expect(viewModel.coverURLString).to(equal(book.images.smallThumbnail), description: "BookSearchViewModel's title is incorrect")
        
        if book.authors.isEmpty {
            expect(viewModel.authorsString).to(equal("Unknown"), description: "BookSearchViewModel's authorString is incorrect")
        } else {
            expect(viewModel.authorsString).to(equal(book.authors.joined(separator: ", ")), description: "BookSearchViewModel's authorString is incorrect")
        }
    }
}

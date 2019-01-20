//
//  BookDetailViewModelTests.swift
//  GoogleBooksTests
//
//  Created by Vo Tung on 20/01/2019.
//  Copyright © 2019 Vo Tung. All rights reserved.
//

import XCTest
import Nimble
@testable import GoogleBooks

class BookDetailViewModelTests: XCTestCase {

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

    private func testGenerateViewModel(from book: Book) {
        let viewModel = BookDetailViewModel(book: book)
        expect(viewModel.description).to(equal(book.description), description: "BookDetailViewModel description is incorrect")
    }

}

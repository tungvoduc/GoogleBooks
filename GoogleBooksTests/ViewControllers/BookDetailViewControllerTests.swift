//
//  BookDetailViewControllerTests.swift
//  GoogleBooksTests
//
//  Created by Vo Tung on 21/01/2019.
//  Copyright © 2019 Vo Tung. All rights reserved.
//

import XCTest
import Nimble
@testable import GoogleBooks

class BookDetailViewControllerTests: XCTestCase {
    
    var sut: BookDetailViewController!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = UIStoryboard.viewController(from: "Main", type: BookDetailViewController.self)
        _ = sut.view
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUpdatingViewModel() {
        let book = Book(id: "abcdef", title: "Title 1", description: "Description 1", authors: ["Author 1", "Author 2"], images: BookImages(smallThumbnail: "abc", thumbnail: "xyz"))
        let viewModel = BookDetailViewModel(book: book)
        
        sut.viewModel = viewModel
        
        expect(self.sut.bookDescriptionLabel.text).to(equal(viewModel.description), description: "")
        expect(self.sut.bookTitleLabel.text).to(equal(viewModel.title), description: "")
        expect(self.sut.bookAuthorsLabel.text).to(equal(viewModel.authorsString), description: "")
        
        sut.viewModel = nil
        expect(self.sut.bookDescriptionLabel.text).to(beNil(), description: "")
        expect(self.sut.bookTitleLabel.text).to(beNil(), description: "")
        expect(self.sut.bookAuthorsLabel.text).to(beNil(), description: "")
    }

}

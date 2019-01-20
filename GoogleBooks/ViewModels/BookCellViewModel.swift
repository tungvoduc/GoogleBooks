//
//  BookCellViewModel.swift
//  GoogleBooks
//
//  Created by Vo Tung on 19/01/2019.
//  Copyright © 2019 Vo Tung. All rights reserved.
//

import Foundation

// Could add abstraction layer here to easy mocking
class BookCellViewModel {
    var title: String
    var authorsString: String
    var coverURLString: String
    
    let book: Book
    
    init(book: Book) {
        self.book = book
        title = book.title
        
        if book.authors.isEmpty {
            authorsString = "Unknown"
        } else {
            authorsString = book.authors.joined(separator: ", ")
        }
        
        coverURLString = book.images.smallThumbnail
    }
}

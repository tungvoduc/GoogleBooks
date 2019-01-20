//
//  BookDetailViewModel.swift
//  GoogleBooks
//
//  Created by Vo Tung on 20/01/2019.
//  Copyright © 2019 Vo Tung. All rights reserved.
//

import Foundation

// Could add abstraction layer here to easy mocking
class BookDetailViewModel: BookCellViewModel {
    var description: String
    
    override init(book: Book) {
        description = book.description
        super.init(book: book)
        coverURLString = book.images.thumbnail
    }
}

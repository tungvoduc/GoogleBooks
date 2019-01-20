//
//  Book.swift
//  GoogleBooks
//
//  Created by Vo Tung on 19/01/2019.
//  Copyright © 2019 Vo Tung. All rights reserved.
//

import Foundation

//MARK: Book
struct Book {
    let id: String
    let title: String
    let description: String
    let authors: [String]
    let images: BookImages
    
    // MARK: - Init -
    init?(dictionary: [String : Any]) {
        guard let volumeInfo = dictionary["volumeInfo"] as? [String : Any],
            let id = dictionary["id"] as? String,
            let description = volumeInfo["description"] as? String,
            let title = volumeInfo["title"] as? String,
            let authors = volumeInfo["authors"] as? [String],
            let imageLinks = volumeInfo["imageLinks"] as? [String : Any],
            let images = BookImages(dictionary: imageLinks)
            else { return nil }
        self.id = id
        self.title = title
        self.description = description
        self.authors = authors
        self.images = images
    }
    
    init(id: String, title: String, description: String, authors: [String], images: BookImages) {
        self.id = id
        self.title = title
        self.description = description
        self.authors = authors
        self.images = images
    }
}

//MARK: BookImages
struct BookImages: Equatable {
    let smallThumbnail: String
    let thumbnail: String
    
    init?(dictionary: [String : Any]) {
        guard let smallThumbnail = dictionary["smallThumbnail"] as? String,
            let thumbnail = dictionary["thumbnail"] as? String
            else { return nil }
        
        self.smallThumbnail = smallThumbnail
        self.thumbnail = thumbnail
    }
    
    init(smallThumbnail: String, thumbnail: String) {
        self.smallThumbnail = smallThumbnail
        self.thumbnail = thumbnail
    }
}

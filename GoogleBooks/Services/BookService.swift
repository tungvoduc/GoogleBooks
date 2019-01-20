//
//  BookService.swift
//  GoogleBooks
//
//  Created by Vo Tung on 19/01/2019.
//  Copyright © 2019 Vo Tung. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

enum BookServiceError: Error {
    case missingAPIKey
}

//MARK: BookRequestable
protocol BookRequestable {
    func books(for title: String) -> Observable<[Book]>
}

//MARK: BookService
class BookService: BookRequestable {
    var webService: Requestable
    var host: String
    var apiKey: String = "AIzaSyAbIwrsnCsOwLKvVNtiPOHVnJarhm2pLEQ"
    
    init(webService: Requestable = WebService(), host: String = "https://www.googleapis.com/books/v1/volumes") {
        self.webService = webService
        self.host = host
    }
    
    func books(for title: String) -> Observable<[Book]> {
        do {
            guard !title.isEmpty else {
                return Observable.empty()
            }
            
            guard !apiKey.isEmpty else {
                throw BookServiceError.missingAPIKey
            }
            
            return webService.request(host: host, endpoint: "/volumes", query: ["q": "\(title)+intitle", "key": apiKey])
                .map({ dictionary -> [[String: Any]] in
                    guard let items = dictionary["items"] as? [[String: Any]] else {
                        return []
                    }
                    return items
                })
                .map({ itemsJSON -> [Book] in
                    itemsJSON.compactMap(Book.init)
                })
        } catch {
            return Observable.empty()
        }
    }
}

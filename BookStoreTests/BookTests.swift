//
//  BookTests.swift
//  BookStoreTests
//
//  Created by Kushal Ashok on 8/1/18.
//  Copyright © 2018 speed. All rights reserved.
//

import XCTest
import ObjectMapper

@testable import BookStore

class BookTests: XCTestCase {
    
    func testBookMap() {
        let attributes: [String : Any] = ["_id": "5b4f17c86d5fa3000fdcdfe8", "title": "Title", "author": "Author", "image": "http://it-ebooks.info/images/ebooks/3/learning_php_mysql_javascript_5th_edition.jpg"]
        guard let book = Mapper<Book>().map(JSON: attributes) else {return XCTFail() }
        XCTAssertEqual(book.id, "5b4f17c86d5fa3000fdcdfe8")
        XCTAssertEqual(book.title, "Title")
        XCTAssertEqual(book.author, "Author")
        XCTAssertEqual(book.image, "http://it-ebooks.info/images/ebooks/3/learning_php_mysql_javascript_5th_edition.jpg")
    }
    
    func getSampleBook() -> Book {
        let book = Book()
        book.id = "5b4f17c86d5fa3000fdcdfe8"
        book.title = "Title"
        book.author = "Author"
        book.image = "http://it-ebooks.info/images/ebooks/3/learning_php_mysql_javascript_5th_edition.jpg"
        return book
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            testBookMap()
        }
    }
    
}

//
//  Book.swift
//  BookStore
//
//  Created by Kushal Ashok on 8/1/18.
//  Copyright © 2018 speed. All rights reserved.
//

import UIKit
import RealmSwift
import ObjectMapper


class Book: Object, Mappable, RealmObject {
    
    @objc dynamic var id = ""
    @objc dynamic var isbn = ""
    @objc dynamic var title = ""
    @objc dynamic var author = ""
    @objc dynamic var publisher = ""
    @objc dynamic var image = ""
    @objc dynamic var v = 0
    
    required convenience init?( map: Map) {
        self.init()
    }
    override class func primaryKey() -> String {
        return "id"
    }
    
    func mapping(map: Map) {
        id <- map["_id"]
        isbn <- map["isbn"]
        title <- map["title"]
        author <- map["author"]
        publisher <- map["publisher"]
        image <- map["image"]
        v <- map["__v"]
        self.update()
    }
    
}

//Sample
//"_id": "5b4f17c86d5fa3000fdcdfe8",
//"isbn": "12312",
//"title": "abc",
//"author": "damon",
//"publisher": "damon",
//"image": "http://it-ebooks.info/images/ebooks/3/learning_php_mysql_javascript_5th_edition.jpg",
//"__v": 0

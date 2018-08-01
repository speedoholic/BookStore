//
//  User.swift
//  BookStore
//
//  Created by Kushal Ashok on 8/1/18.
//  Copyright © 2018 speed. All rights reserved.
//

import UIKit
import RealmSwift
import ObjectMapper


class User: Object, Mappable, RealmObject {
    
    @objc dynamic var username = ""
    
    required convenience init?( map: Map) {
        self.init()
    }
    override class func primaryKey() -> String {
        return "username"
    }
    
    func mapping(map: Map) {
        username <- map["username"]
        self.update()
    }
    
}

//
//  Item.swift
//  Todoey
//
//  Created by 陳剣輝 on 2018/03/15.
//  Copyright © 2018年 陳剣輝. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}

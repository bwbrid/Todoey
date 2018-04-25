//
//  Category.swift
//  Todoey
//
//  Created by 陳剣輝 on 2018/03/15.
//  Copyright © 2018年 陳剣輝. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    
    @objc dynamic var name: String = ""
    let items = List<Item>()
}

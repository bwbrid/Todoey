//
//  Item.swift
//  Todoey
//
//  Created by 陳剣輝 on 2018/03/04.
//  Copyright © 2018年 陳剣輝. All rights reserved.
//

import Foundation

// Encodable, Decodable = Codable
class Item : Codable {
    
    var title: String = ""
    var done: Bool = false
}

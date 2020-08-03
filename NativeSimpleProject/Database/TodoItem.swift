//
//  TodoItem.swift
//  NativeSimpleProject
//
//  Created by mac on 30.07.2020.
//  Copyright © 2020 Yok. All rights reserved.
//

import Foundation

struct TodoItem: Codable, Hashable {
    let id: String
    let name: String
    var complated: Bool
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case complated
    }
    
    init(id: String = UUID().uuidString, name: String, complated: Bool = false ) {
        self.id = id
        self.name = name
        self.complated = complated
    }
}

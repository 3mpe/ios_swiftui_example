//
//  TodoItemDetail.swift
//  NativeSimpleProject
//
//  Created by mac on 30.07.2020.
//  Copyright © 2020 Yok. All rights reserved.
//

struct TodoItemDetail: Codable {
    var userName: String
    var photoUrl: String
    
    enum CodingKeys: CodingKey {
        case userName
        case photoUrl
    }
}

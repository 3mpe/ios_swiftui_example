//
//  UserService.swift
//  NativeSimpleProject
//
//  Created by Neyasis on 19.07.2020.
//  Copyright © 2020 Yok. All rights reserved.
//

import Foundation
import Alamofire

class UserService {
    private var api = ApiService.Instance;
    
    func todos (parameters: Parameters!, completion: @escaping (Any) -> Void) {
        api.get("/todos", parameters:parameters ) { (response) in
            completion(response);
        }
    }

}
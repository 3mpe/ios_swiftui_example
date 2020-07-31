//
//  ViewModelRegister.swift
//  NativeSimpleProject
//
//  Created by mac on 31.07.2020.
//  Copyright © 2020 Yok. All rights reserved.
//

import Foundation
import Combine

class ViewModelRegister: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    let fbAuthManager: FirebaseAuthManager;
    private var disposables = Set<AnyCancellable>()
    
    init(fbAuthManager: FirebaseAuthManager = FirebaseAuthManager.shared) {
        self.fbAuthManager = fbAuthManager
    }
    
    func register () {
         print("register started")
        fbAuthManager.createUser(email: email, password: password) { (success) in
            if (success) {
                print("register success")
            } else {
                print("register error")
            }
        }
    }
}

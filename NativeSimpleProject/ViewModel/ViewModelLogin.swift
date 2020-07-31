//
//  ViewModelLogin.swift
//  NativeSimpleProject
//
//  Created by Emre Vatansever on 20.07.2020.
//  Copyright © 2020 Yok. All rights reserved.
//

import Foundation
import Combine

class LoginModel: Codable {
    
}

class ViewModelLogin: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var areYouGoingToSecondView: Bool = false
    
    let fbAuthManager: FirebaseAuthManager;
    private var disposables = Set<AnyCancellable>()
    
    init(fbAuthManager: FirebaseAuthManager = FirebaseAuthManager.shared) {
        self.fbAuthManager = fbAuthManager;
    }
    
    func login () {
         print("logged started")
        fbAuthManager.Login(email: email, password: password) { (loggedIn) in
            if (loggedIn) {
                print("logged in mvvm")
            } else {
                print("not logged mvvm")
            }
        }
    }
    
}

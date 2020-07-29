//
//  ViewModelLogin.swift
//  NativeSimpleProject
//
//  Created by Neyasis on 20.07.2020.
//  Copyright © 2020 Yok. All rights reserved.
//

import Foundation
import Combine

class LoginModel: Codable {
    
}

class ViewModelLogin: ObservableObject {
    let objectWillChange: AnyPublisher<LoginModel, Never>
    let objectWillChangeSubject = PassthroughSubject<LoginModel, Never>()
     
    init(repository: LoginModel) {
         objectWillChange = objectWillChangeSubject.eraseToAnyPublisher()
    }
}

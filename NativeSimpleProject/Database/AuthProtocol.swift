//
//  AuthProtocol.swift
//  NativeSimpleProject
//
//  Created by mac on 30.07.2020.
//  Copyright © 2020 Yok. All rights reserved.
//
import GoogleSignIn
import GTMSessionFetcher

protocol AuthProtocol {
    func singOut() -> Void
    func Login (email: String, password: String, completion: @escaping (Bool) -> Void) -> Void
    func createUser (email: String, password: String, completion: @escaping (Bool) -> Void) -> Void
    func userMe() -> Any
    func updatePassword(password: String, completion: @escaping (Bool) -> Void) -> Void
    func updateEmail(email: String, completion: @escaping (Bool) -> Void) -> Void
    func sendEmailVerification(completion: @escaping (Bool) -> Void) -> Void
    func sendPasswordResetEmail(email: String, completion: @escaping (Bool) -> Void) -> Void
    
    // signin google
    func signInWithGoogle() -> Void
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!)
}

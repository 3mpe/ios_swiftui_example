//
//  FirebaseAuthManager.swift
//  NativeSimpleProject
//
//  Created by mac on 30.07.2020.
//  Copyright © 2020 Yok. All rights reserved.
//
import FirebaseAuth
import GoogleSignIn
import GTMSessionFetcher


class FirebaseAuthManager {
    private let auth = Auth.auth();
    
    static let shared: FirebaseAuthManager = FirebaseAuthManager()
    private init() {}
}


extension FirebaseAuthManager: AuthProtocol {

    func signInWithGoogle() {
        GIDSignIn.sharedInstance().signIn()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error.localizedDescription)
            return
        } else {
            guard let auth = user.authentication else { return }
            let credentials = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
            Auth.auth().signIn(with: credentials) { (authResult, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("login successed")
                }
            }
        }
    }
    
    
    func sendPasswordResetEmail(email: String, completion: @escaping (Bool) -> Void) {
        auth.sendPasswordReset(withEmail: email) { (error) in
            if error != nil {
                completion(false)
            } else {
                completion(true)
            }
        }
    }
    
    func updatePassword(password: String, completion: @escaping (Bool) -> Void) {
        let user = auth.currentUser
        if (user == nil) { completion(false) }
        user?.updatePassword(to: password, completion: { (error) in
            if error != nil {
                completion(false)
            } else {
                completion(true)
            }
        })
    }
    
    func updateEmail(email: String, completion: @escaping (Bool) -> Void) {
        let user = auth.currentUser
        if (user == nil) { completion(false) }
        user?.updateEmail(to: email, completion: { (error) in
           if error != nil {
               completion(false)
           } else {
               completion(true)
           }
        })
    }
    
    func sendEmailVerification(completion: @escaping (Bool) -> Void) {
        let user = auth.currentUser
        if (user == nil) { completion(false) }
        user?.sendEmailVerification(completion: { (error) in
            if error != nil {
                completion(false)
            } else {
                completion(true)
            }
        })
    }
    
    
    func userMe() -> Any {
        let user = auth.currentUser;
        
        print("current user info \(String(describing: user))")
        return user as Any;
    }
    
    
    func singOut() {
        do {
            try auth.signOut()
        } catch let error as NSError {
            print("signout error \(error)")
        }
    }
    
    func Login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        auth.signIn(withEmail: email, password: password) { (result, error) in
            if let user = result?.user {
                print("User was sucessfully logged in \(user)")
                completion(true);
                
            } else {
                completion(false);
            }
        }
    }
    
    
    func createUser(email: String, password: String, completion: @escaping (Bool) -> Void) {
        auth
            .createUser(withEmail: email, password: password) { (authResult, error) in
                if let user = authResult?.user {
                    print("User was sucessfully created \(user)")
                    completion(true);
                } else {
                    print("user not created, \(String(describing: error))")
                    completion(false);
                }
            }
    }
    
    
}

//
//  FirestoreDatabase.swift
//  NativeSimpleProject
//
//  Created by mac on 30.07.2020.
//  Copyright © 2020 Yok. All rights reserved.
//


import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift


class FirestoreDatabase  {
    private let firebaseDb = Firestore.firestore()
    static  let shared: FirestoreDatabase = FirestoreDatabase()
    private let todoosCollections = "todos"
    
    private init() {}
    
}

extension FirestoreDatabase: TodoDB {
    func add(usingTodoItem todoItem: TodoItem) -> Bool {
        do {
            let ref = try firebaseDb
                .collection(todoosCollections)
                .addDocument(from: todoItem);
            print("added document id = \(ref.documentID)")
        }
        catch let error {
            print("add document failed \(error)")
            return false
        }
        
        return true
    }
    
    func update(usingTodoItem todoItem: TodoItem) {
        firebaseDb
            .collection(todoosCollections)
            .whereField("id", isEqualTo: todoItem.id)
            .getDocuments { (item, error) in
                if let error = error {
                    print("Document error: \(error)")
                } else {
                    if let document = item?.documents.first {
                        do {
                            try document.reference.setData(from: todoItem)
                        }
                        catch let error {
                            print("document read error \(error)")
                        }
                        
                    }
                }
            }
    }
    
    func delete(usingId id: String) {
        firebaseDb
            .collection(todoosCollections)
            .whereField("id", isEqualTo: id)
            .getDocuments { (item, error) in
                if let error = error {
                    print("Document Error: \(error)")
                }
                else {
                    if let document = item?.documents.first {
                        document.reference.delete { (error) in
                            if let error = error {
                                print("Document delete Error: \(error)")
                            }
                            else {
                                print("Document deleted")
                            }
                        }
                    }
                }
            }
    }
    
    
}

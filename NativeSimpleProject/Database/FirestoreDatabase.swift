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
    func getList(completion: @escaping (Bool, [TodoItem]) -> Void) {
        firebaseDb.collection(todoosCollections).getDocuments { (querySnap, err) in
            if let error = err {
              print("getList document error: \(error)")
              completion(false, [])
            } else {
                var data = [TodoItem]()
                for document in querySnap!.documents {
                    let item = document.data()
                    data.append(TodoItem(id: item["id"] as! String, name: item["name"] as! String, complated: (item["complated"]) as! Bool ))
                    print("\(document.documentID) => \(document.data())")
                }
                print("getList : \(data)")
                completion(false, data)
                
            }
        }
    }
    
  
    
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
    
    func update(usingTodoItem todoItem: TodoItem, completion: @escaping (Bool) -> Void) {
        firebaseDb
            .collection(todoosCollections)
            .whereField("id", isEqualTo: todoItem.id)
            .getDocuments { (item, error) in
                if let error = error {
                    print("Document error: \(error)")
                    completion(false)
                } else {
                    if let document = item?.documents.first {
                        do {
                            try document.reference.setData(from: todoItem)
                            completion(true)
                        }
                        catch let error {
                            print("document read error \(error)")
                            completion(false)
                        }
                        
                    }
                }
            }
    }
    
    func delete(usingId id: String, completion: @escaping (Bool) -> Void) {
        firebaseDb
            .collection(todoosCollections)
            .whereField("id", isEqualTo: id)
            .getDocuments { (item, error) in
                if let error = error {
                    print("Document Error: \(error)")
                    completion(false)
                }
                else {
                    if let document = item?.documents.first {
                        document.reference.delete { (error) in
                            if let error = error {
                                print("Document delete Error: \(error)")
                                completion(true)
                            }
                            else {
                                print("Document deleted")
                                completion(false)
                            }
                        }
                    }
                }
            }
    }
    
    
}

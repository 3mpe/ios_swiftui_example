//
//  TodoDB.swift
//  NativeSimpleProject
//
//  Created by Emre Vatansever on 30.07.2020.
//  Copyright © 2020 Yok. All rights reserved.
//

protocol TodoDB {
    func add(usingTodoItem todoItem: TodoItem) -> Bool
    func update(usingTodoItem todoItem: TodoItem, completion: @escaping (Bool) -> Void) -> Void
    func delete(usingId id: String, completion: @escaping (Bool) -> Void) -> Void
    func getList(completion: @escaping (Bool, [TodoItem]) -> Void) -> Void
}

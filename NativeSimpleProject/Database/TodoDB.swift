//
//  TodoDB.swift
//  NativeSimpleProject
//
//  Created by Emre Vatansever on 30.07.2020.
//  Copyright © 2020 Yok. All rights reserved.
//

protocol TodoDB {
    func add(usingTodoItem todoItem: TodoItem) -> Bool
    func update(usingTodoItem todoItem: TodoItem) -> Void
    func delete(usingId id: String) -> Void
}

//
//  TodoViewModel.swift
//  NativeSimpleProject
//
//  Created by mac on 30.07.2020.
//  Copyright © 2020 Yok. All rights reserved.
//

import Foundation

protocol TodoViewDelegate: class {
    func onAddTodoItem () -> ()
    func onDelete(todoId: String) ->  ()
    func onDone (todoId: String) -> ()
}

protocol TodoViewPresentable {
    var newTodoItem: String? { get set }
    var items: [TodoItem] { get }
}

class TodoViewModel: TodoViewPresentable {
    // weak var view: TodoView?
    
    var newTodoItem: String?
    var items: [TodoItem] = []
    
    let database: TodoDB
    
    init(database: TodoDB = FirestoreDatabase.shared) {
        self.database = database
    }
      
}

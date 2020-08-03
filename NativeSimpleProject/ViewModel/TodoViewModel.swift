//
//  TodoViewModel.swift
//  NativeSimpleProject
//
//  Created by mac on 30.07.2020.
//  Copyright © 2020 Yok. All rights reserved.
//

import Foundation
import Combine

protocol TodoViewDelegate: ObservableObject {
    func onAddTodoItem () -> ()
    func onDelete(todoId: String) ->  ()
    func onDone (todoId: String) -> ()
    func getList() -> ()
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
    
    private var disposables = Set<AnyCancellable>()
    
    init(database: TodoDB = FirestoreDatabase.shared) {
        self.database = database
    }
      
}

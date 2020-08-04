//
//  TodoViewModel+Delegate.swift
//  NativeSimpleProject
//
//  Created by mac on 30.07.2020.
//  Copyright © 2020 Yok. All rights reserved.
//

import Foundation

extension TodoViewModel: TodoViewDelegate {
    func getList() {
        database.getList { (isOk, list) in
            self.items = list
            self.objectWillChange.send()
        }
    }
    
    
    func onAddTodoItem() {
        guard let newValue = newTodoItem else {
            print("new value empty")
            return
        }
        let success =  database.add(usingTodoItem: TodoItem(name: newValue))
        print("Todo item added \(success)")
        getList()
    }
    
    func onDelete(todoId: String) {
        database.delete(usingId: todoId, completion: { status in
            if status {
                self.getList()
            }
        })
        
        
    }
    
    func onDone(todoId: String) {
        var item = self.items.first(where: { $0.id == todoId })
        item!.complated = !item!.complated
        database.update(usingTodoItem: item!, completion: { status in
            if status {
                self.getList()
            }
        })
        
    }
    
    
}

//
//  TodoList.swift
//  NativeSimpleProject
//
//  Created by mac on 31.07.2020.
//  Copyright © 2020 Yok. All rights reserved.
//

import SwiftUI
import Combine

struct TodoList: View {
    @ObservedObject var todoVM = TodoViewModel();
    @State var filterText: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "task")
                    .foregroundColor(.gray)
                TextField("New Task", text: $filterText)
                Button (action: {
                    self.todoVM.newTodoItem = self.filterText
                    self.todoVM.onAddTodoItem()
                    self.todoVM.objectWillChange.send()
                }) {
                    Text("Gonder")
                }
            }
            
            List {
                ForEach(self.todoVM.items, id: \.id) { (_todoVM) in
                    Button (action: {
                      self.todoVM.onDone(todoId: _todoVM.id) 
                    }) {
                        HStack {
                            Image(systemName: _todoVM.complated ? "checkmark.circle" : "circle")
                                .resizable()
                                .frame(width: 25, height: 25)
                            Text(_todoVM.name)
                        }
                    }
                }
            }
            
        }
        .onAppear {
            self.todoVM.getList()
            print("todoVmItems : \(self.todoVM.items)")
        }
    }
}

struct TodoList_Previews: PreviewProvider {
    
    static var previews: some View {
        TodoList()
    }
}

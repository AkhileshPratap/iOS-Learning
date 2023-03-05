//
//  ToDoFormViewModel.swift
//  TODO
//
//  Created by AkhileshSingh on 04/03/23.
//

import Foundation

class ToDoFormViewModel: ObservableObject {
    @Published var name = ""
    @Published var completed = false
    var id: String?
    
    var updating: Bool {
        id != nil
    }
    
    var isDisabled: Bool {
        name.isEmpty
    }
    
    init() {}
    
    init( _ currentToDo: ToDo) {
        self.name = currentToDo.name
        self.completed = currentToDo.completed
        self.id = currentToDo.id
    }
    
}

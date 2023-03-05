//
//  ModelType.swift
//  TODO
//
//  Created by AkhileshSingh on 05/03/23.
//

import SwiftUI

enum ModelType: Identifiable, View {
    case new
    case update(ToDo)
    
    var id: String {
        switch self {
        case .new:
            return "new"
        case .update:
             return "update"
        }
    }
    
    var body: some View {
        switch self {
        case .new:
            return ToDoFormView(formViewModel: ToDoFormViewModel())
        case .update(let toDo):
            return ToDoFormView(formViewModel: ToDoFormViewModel(toDo))
        }
    }
}

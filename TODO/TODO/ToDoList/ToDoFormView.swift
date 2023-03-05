//
//  ToDoFormView.swift
//  TODO
//
//  Created by AkhileshSingh on 04/03/23.
//

import SwiftUI

struct ToDoFormView: View {
    @EnvironmentObject var dataStore: DataStore
    @ObservedObject var formViewModel: ToDoFormViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                VStack (alignment: .leading) {
                    TextField("ToDo", text: $formViewModel.name)
                    Toggle("Compelted", isOn: $formViewModel.completed)
                }
            }
            .navigationTitle("ToDo")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: cancelButton, trailing: updateSaveButton)
        }
    }
}

extension ToDoFormView {
    
    func updateToDo() {
        let toDo = ToDo(id: formViewModel.id!, name: formViewModel.name, completed: formViewModel.completed)
        dataStore.updateToDo(toDo)
        presentationMode.wrappedValue.dismiss()
    }
    
    func addToDo() {
        let toDo = ToDo(name: formViewModel.name)
        dataStore.addToDo(toDo)
        presentationMode.wrappedValue.dismiss()
    }
    
    var cancelButton: some View {
        Button("cancel") {
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    var updateSaveButton: some View {
        Button(formViewModel.updating ? "update" : "save", action: formViewModel.updating ? updateToDo : addToDo)
            .disabled(formViewModel.isDisabled)
    }
}

struct ToDoFormView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoFormView(formViewModel: ToDoFormViewModel())
            .environmentObject(DataStore())
    }
}

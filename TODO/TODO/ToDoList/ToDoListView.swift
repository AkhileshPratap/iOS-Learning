//
//  ContentView.swift
//  TODO
//
//  Created by AkhileshSingh on 04/03/23.
//

import SwiftUI

struct ToDoListView: View {
    @EnvironmentObject var dataStore: DataStore
    @State private var modelType: ModelType? = nil
    var body: some View {
        NavigationView {
            List() {
                ForEach(dataStore.toDos) { toDo in
                    Button {
                        modelType = .update(toDo)
                    } label: {
                        Text(toDo.name)
                            .font(.title)
                            .strikethrough(toDo.completed)
                            .foregroundColor(toDo.completed ? .green : Color(.label))
                    }
                }
                .onDelete(perform: dataStore.deleteToDo)
            }
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("My ToDos")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        modelType = .new
                    } label: {
                         Image(systemName: "plus.circle.fill")
                    }
                }
            }
        }
        .sheet(item: $modelType) { modelType in
            modelType
        }
        .alert(item: $dataStore.appError) { appError in
            Alert(title: Text("ohh"), message: Text(appError.error.localizedDescription))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
            .environmentObject(DataStore())
    }
}

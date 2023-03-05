//
//  DataStore.swift
//  TODO
//
//  Created by AkhileshSingh on 04/03/23.
//

import Foundation

class DataStore: ObservableObject {
    @Published var toDos: [ToDo] = []
    @Published var appError: ErrorType? = nil
    
    init() {
        print(FileManager.docDirURL.path)
        if FileManager().docExist(named: fileName) {
            loadToDos()
        }
    }
    
    func addToDo(_ toDo: ToDo) {
        toDos.append(toDo)
        saveToDos()
    }
    
    func updateToDo( _ toDo: ToDo) {
        guard let index = toDos.firstIndex(where: {$0.id == toDo.id}) else { return }
        toDos[index] = toDo
        saveToDos()
        
    }
    
    func deleteToDo(at indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
        saveToDos()
    }
    
    func loadToDos() {
        FileManager().readDocument(docName: fileName) { (result) in
            switch result {
            case .success(let data):
                do {
                    let decoder = try JSONDecoder().decode([ToDo].self, from: data)
                    toDos = decoder
                } catch {
//                    print(ToDoError.decodingError.localizedDescription)
                    appError = ErrorType(error: .decodingError)
                }
            case .failure(let error):
//                print(ToDoError.readError.localizedDescription)
                appError = ErrorType(error: error)
            }
        }
//        toDos = ToDo.sampleData
    }
    
    func saveToDos() {
        print("all todos \(toDos)")
        
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(toDos)
            let jsonString = String(decoding: data, as: UTF8.self)
            FileManager().saveDocument(contents: jsonString, docName: fileName) { error in
                if let error {
//                    print(ToDoError.saveError.localizedDescription)
                    appError = ErrorType(error: error)
                }
            }
        } catch {
//            print(ToDoError.encodingError.localizedDescription)
            appError = ErrorType(error: .encodingError)
        }
    }
}

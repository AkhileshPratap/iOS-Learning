//
//  ToDo.swift
//  TODO
//
//  Created by AkhileshSingh on 04/03/23.
//

import Foundation

enum ToDoError: Error, LocalizedError {
    case saveError
    case readError
    case decodingError
    case encodingError
    
    var errorDescription: String? {
        switch self {
        case .saveError:
            return NSLocalizedString("save error", comment: "")
        case .readError:
            return NSLocalizedString("read error", comment: "")
        case .decodingError:
            return NSLocalizedString("decoding error", comment: "")
        case .encodingError:
            return NSLocalizedString("encoding error", comment: "")
        }
    }
}

struct ErrorType: Identifiable {
    let id = UUID()
    var error: ToDoError
}

struct ToDo: Identifiable, Codable {
    var id: String = UUID().uuidString
    var name: String
    var completed: Bool = false
    
    static var sampleData: [ToDo] {
        [ ToDo(name: "get Grocessies"),
          ToDo(name: "com", completed: true)
        ]
    }
}

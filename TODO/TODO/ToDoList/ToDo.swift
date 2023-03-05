//
//  ToDo.swift
//  TODO
//
//  Created by AkhileshSingh on 04/03/23.
//

import Foundation

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

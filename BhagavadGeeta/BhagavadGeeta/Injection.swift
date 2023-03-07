//
//  Injection.swift
//  BhagavadGeeta
//
//  Created by AkhileshSingh on 07/03/23.
//

import Foundation
import Swinject

final class Injection {
    static let shared = Injection()
    private init() {}
    
    var container: Container {
        get {
            if _container == nil {
                _container = buildContainer()
            }
            return _container!
        }
        
        set {
            _container = newValue
        }
    }
    
    private var _container: Container?
    
    private func buildContainer() -> Container {
        let container = Container()
        container.register(Loggable.self) { _ in
            return Logger()
        }
        return container
    }
}

@propertyWrapper struct Injected<Dependency> {
    let wrappedValue: Dependency
    
    init() {
        wrappedValue = Injection.shared.container.resolve(Dependency.self)!
    }
    
}

//
//  ConfigurationManager.swift
//  BhagavadGeeta
//
//  Created by AkhileshSingh on 07/03/23.
//

import Foundation

private enum BuildConfiguration {
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }
    
    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) else {
            throw Error.missingKey
        }
        
        switch object {
        case let str as String:
            guard let value = T(str) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }
}

enum EndPoint {
    static var baseURL: String {
        do {
            return try BuildConfiguration.value(for: "BASE_URL")
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
}


enum ConfigurationManager {
    enum Environment {
        case dev
        case qa
        case prod
    }
    
    static var environment: Environment {
#if DEV
        return .dev
#elseif QA
        return .qa
#elseif PROD
        return .prod
#endif
    }
}

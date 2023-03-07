//
//  Logger.swift
//  BhagavadGeeta
//
//  Created by AkhileshSingh on 07/03/23.
//

import Foundation
import SwiftyBeaver

protocol Loggable {
    func verbose(_ message: String, _ file: String, _ function: String, _ line: Int)
    func debug(_ message: String, _ file: String, _ function: String, _ line: Int)
    func info(_ message: String, _ file: String, _ function: String, _ line: Int)
    func warning(_ message: String, _ file: String, _ function: String, _ line: Int)
    func error(_ message: String, _ file: String, _ function: String, _ line: Int)
}

extension Loggable {
    func verbose(_ message: String = "default message", _ file: String = #file,
                 _ function: String = #function, line: Int = #line) {
        verbose(message, file, function, line)
    }
    
    func debug(_ message: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        debug(message, file, function, line)
    }
    
    func info(_ message: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        info(message, file, function, line)
    }
    
    func warning(_ message: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        warning(message, file, function, line)
    }
    
    func error(_ message: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        error(message, file, function, line)
    }
}

class Logger: Loggable {

    private var log: SwiftyBeaver.Type {
        let log = SwiftyBeaver.self
        let console = ConsoleDestination()
        console.format = "$DHH:mm:ss$d $L: $M"  // hour, minute, second, loglevel and message
        log.addDestination(console)
        return log
    }
    
    func verbose(_ message: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        log.verbose(message, file: file, function: function, line: line)
    }
    
    func debug(_ message: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        log.debug(message, file: file, function: function, line: line)
    }
    
    func info(_ message: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        log.info(message, file: file, function: function, line: line)
    }
    
    func warning(_ message: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        log.debug(message, file: file, function: function, line: line)
    }
    
    func error(_ message: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        log.debug(message, file: file, function: function, line: line)
    }

}

// Singelton Logger
final class Loggers {
    static let shared = Loggers()
    
    private var log: SwiftyBeaver.Type {
        let log = SwiftyBeaver.self
        let console = ConsoleDestination()
        console.format = "$DHH:mm:ss$d $L: $M"  // hour, minute, second, loglevel and message
        log.addDestination(console)
        return log
    }
    
    private init() {}
    
    func verbose(_ message: String, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
        log.verbose(message, file: file, function: function, line: line)
    }
}

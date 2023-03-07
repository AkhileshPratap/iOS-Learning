//
//  AnalyticManager.swift
//  BhagavadGeeta
//
//  Created by AkhileshSingh on 07/03/23.
//

import Foundation

protocol Eventable {
    var name: String { get }
    var param: [String: Any] { get }
}

struct Event: Eventable {
    var name: String
    var param: [String: Any]
}

enum AnalyticsEvent {
   case clickButton
    case chapterTapped(name: String)
}

extension AnalyticsEvent: Eventable {
    var name: String {
        switch self {
        case .clickButton:
            return "click_button"
        case .chapterTapped:
            return "chapter_tapped"
        }
    }
    
    var param: [String: Any] {
        switch self {
        case .clickButton:
            return [:]
        case .chapterTapped(let name):
            return ["name": name]
        }
    }
}


protocol AnalyticsEventLoggerProtocol {
    func initialize()
    func logEvent(event: Eventable)
}

protocol AnalyticsManagerProtocol {
    func logEvent(event: Eventable)
}

final class AnalyticsManager: AnalyticsManagerProtocol {
    
    private let analyticsLogger: AnalyticsEventLoggerProtocol
    
    init(analyticsLogger: AnalyticsEventLoggerProtocol) {
        self.analyticsLogger = analyticsLogger
    }
    
    func logEvent(event: Eventable) {
        analyticsLogger.logEvent(event: event)
    }
}

final class FirebaseAnalyticsManager: AnalyticsEventLoggerProtocol {
    func initialize() {
        // Initialize you anlytics here
    }
    
    func logEvent(event: Eventable) {
        Analytics.logEvent(event.name, parameters: event.param)
    }
    
    
}


final class Analytics {
    static func logEvent(_ eventName: String, parameters: [String: Any]) {
        print("eventName: \(eventName) \n parameters: \(parameters)")
    }
}

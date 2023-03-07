//
//  ContentViewModel.swift
//  BhagavadGeeta
//
//  Created by AkhileshSingh on 07/03/23.
//

import Foundation

final class ContentViewModel: ObservableObject {
    @Injected private var log: Loggable
    @Injected private var analyticsManager: AnalyticsManagerProtocol
    
    func onAppear() {
        log.info("view model on appear")
//        log.verbose(EndPoint.baseURL)
//        print(ConfigurationManager.environment)
        
        analyticsManager.logEvent(event: AnalyticsEvent.chapterTapped(name: "chapter"))
    }
}

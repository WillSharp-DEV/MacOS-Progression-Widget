//
//  AppIntent.swift
//  The Widget
//
//  Created by William Sharp on 1/15/26.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Progression Dates"
    static var description = IntentDescription("This is where you will set the start and end dates of the time you want to track!")
    @Parameter(title: "Start Date")
    var startDate: Date?
    @Parameter(title: "End Date")
    var endDate: Date?
    init() {}
    init(startDate: Date?, endDate: Date?) {
        self.startDate = startDate
        self.endDate = endDate
    }
}

//
//  The_Widget.swift
//  The Widget
//
//  Created by William Sharp on 1/15/26.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }

//    func relevances() async -> WidgetRelevances<ConfigurationAppIntent> {
//        // Generate a list containing the contexts this widget is relevant in.
//    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
}

func GetPercentage(start: Date, end: Date) -> Double {
    let now = Date()
    let totalduration = end.timeIntervalSince(start)
    let elapsed = now.timeIntervalSince(start)
    let percentage = (elapsed/totalduration)
    return max(0, min(1,percentage))
}

struct The_WidgetEntryView : View {
    var entry: Provider.Entry
    let statusMessages: [String] = [
            /* 0 */   "And so it begins...",
            /* 1 */   "Is this thing even on?",
            /* 2 */   "A watched pot never boils.",
            /* 3 */   "Do pixels get tired?",
            /* 4 */   "I should probably hydrate.",
            /* 5 */   "Still basically 0%.",
            /* 6 */   "Loading personality...",
            /* 7 */   "Imagine if time went backwards.",
            /* 8 */   "Progress is an illusion.",
            /* 9 */   "Single digits. Cute.",
            /* 10 */  "10%. We have lift off.",
            /* 11 */  "I wonder what my dog is thinking.",
            /* 12 */  "Is a hotdog a sandwich?",
            /* 13 */  "Unlucky number?",
            /* 14 */  "Time is a flat circle.",
            /* 15 */  "15%. Slow and steady.",
            /* 16 */  "I’d rather be sleeping.",
            /* 17 */  "Do penguins have knees?",
            /* 18 */  "Adulting is hard.",
            /* 19 */  "Why is it called a building if it's built?",
            /* 20 */  "20%. One fifth of the way.",
            /* 21 */  "Insert coin to continue.",
            /* 22 */  "I wonder if fish think we're drowning in air.",
            /* 23 */  "Nobody reads these anyway.",
            /* 24 */  "Thinking about cheese.",
            /* 25 */  "25%. Quarter life crisis.",
            /* 26 */  "If I blink, will it go faster?",
            /* 27 */  "Spoiler: It won't.",
            /* 28 */  "Buffering...",
            /* 29 */  "Calculating infinity...",
            /* 30 */  "30%. Getting somewhere.",
            /* 31 */  "Did I leave the stove on?",
            /* 32 */  "Existential dread setting in.",
            /* 33 */  "33.33333 repeating.",
            /* 34 */  "Is water wet?",
            /* 35 */  "Almost a third. Sort of.",
            /* 36 */  "I need coffee.",
            /* 37 */  "Or maybe a nap.",
            /* 38 */  "Why is the alphabet in that order?",
            /* 39 */  "Hold on tight.",
            /* 40 */  "40%. The hill is getting steep.",
            /* 41 */  "Approaching the answer.",
            /* 42 */  "The answer is 42.",
            /* 43 */  "Are we there yet?",
            /* 44 */  "Are we there yet?",
            /* 45 */  "Are we there yet?",
            /* 46 */  "Physics is just applied math.",
            /* 47 */  "Math is just applied pain.",
            /* 48 */  "Bracing for impact.",
            /* 49 */  "On the edge of glory.",
            /* 50 */  "HALFWAY THERE! (Livin' on a prayer)",
            /* 51 */  "Over the hump.",
            /* 52 */  "Downhill from here.",
            /* 53 */  "Gravity is working with us now.",
            /* 54 */  "Keep moving forward.",
            /* 55 */  "Speed limit enforced by aircraft.",
            /* 56 */  "56%. A very specific number.",
            /* 57 */  "Heinz 57 varieties of waiting.",
            /* 58 */  "Loading assets...",
            /* 59 */  "Rendering future...",
            /* 60 */  "60%. Solid passing grade.",
            /* 61 */  "I see the light.",
            /* 62 */  "Wait, is that a train?",
            /* 63 */  "No, it's the finish line.",
            /* 64 */  "Nintendo 64 was great.",
            /* 65 */  "Retirement age?",
            /* 66 */  "Execute Order 66.",
            /* 67 */  "Almost nice.",
            /* 68 */  "So close to nice.",
            /* 69 */  "Nice.",
            /* 70 */  "70%. C's get degrees.",
            /* 71 */  "Cruising altitude.",
            /* 72 */  "Don't look down.",
            /* 73 */  "I can smell the finish line.",
            /* 74 */  "Smells like victory.",
            /* 75 */  "75%. Three quarters done!",
            /* 76 */  "Soldier 76 reporting.",
            /* 77 */  "Lucky number 77.",
            /* 78 */  "Rolling...",
            /* 79 */  "Gold plating the progress bar.",
            /* 80 */  "80%. B- average.",
            /* 81 */  "Kobe's high score.",
            /* 82 */  "Don't stop me now.",
            /* 83 */  "Having a good time.",
            /* 84 */  "It's happening!",
            /* 85 */  "85%. High distinction.",
            /* 86 */  "86 the waiting.",
            /* 87 */  "Four score and seven...",
            /* 88 */  "Great Scott! 88 MPH!",
            /* 89 */  "So close I can taste it.",
            /* 90 */  "90%. FINAL STRETCH!",
            /* 91 */  "MAXIMUM EFFORT!",
            /* 92 */  "EYES ON THE PRIZE!",
            /* 93 */  "DON'T GIVE UP!",
            /* 94 */  "ALMOST...",
            /* 95 */  "STAY ON TARGET...",
            /* 96 */  "HOLD THE LINE!",
            /* 97 */  "WAIT FOR IT...",
            /* 98 */  "98%...",
            /* 99 */  "99% (Please don't crash)",
            /* 100 */ "YOU DID IT! FREEDOM!"
        ]

    var body: some View {
        let sStart = entry.configuration.startDate ?? Date ()
        let sEnd = entry.configuration.endDate ?? Date()
        let sTitle = entry.configuration.ProgressTitle ?? "Loading..."
        let Progress = GetPercentage(start: sStart, end: sEnd)
        VStack {
            Text(sTitle)
                .font(Font.headline.bold())
            ProgressView(value: Progress)
            Text(String(Int(Progress*100)) + "%")
                .font(Font.caption.bold())
            Text(statusMessages[Int((Progress*100).rounded())])
                .font(Font.caption.bold())
        }
    }
}

struct The_Widget: Widget {
    let kind: String = "The_Widget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            The_WidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

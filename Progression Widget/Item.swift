//
//  Item.swift
//  Progression Widget
//
//  Created by William Sharp on 1/15/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

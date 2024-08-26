//
//  Item.swift
//  Kika
//
//  Created by Gustavo Fior on 26/08/24.
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

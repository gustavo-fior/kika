import Foundation
import SwiftData

@Model
class WakeUpChallenge {
    @Attribute(.unique) let id: UUID
    var isPremium: Bool
    var label: String
    
    init(time: Date, isPremium: Bool = false, label: String = "") {
        self.id = UUID()
        self.isPremium = isPremium
        self.label = label
    }
}

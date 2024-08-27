import Foundation
import SwiftData

@Model
class Alarm {
    @Attribute(.unique) let id: UUID
    var time: Date
    var isEnabled: Bool
    var label: String
    var repeatDays: [Int]
    
    @Relationship(deleteRule: .noAction)
    var wakeUpChallenge: WakeUpChallenge?
    
    init(time: Date, label: String, repeatDays: [Int] = []) {
        self.id = UUID()
        self.time = time
        self.isEnabled = true
        self.label = label
        self.repeatDays = repeatDays
    }	
}

//
//  AlarmRow.swift
//  Kika
//
//  Created by Gustavo Fior on 27/08/24.
//

import SwiftUI

struct AlarmRow: View {
    @Bindable var alarm: Alarm
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(alarm.time, style: .time)
                    .font(.largeTitle)
                Text(alarm.label)
                    .font(.caption)
            }
            Spacer()
            Toggle("", isOn: $alarm.isEnabled)
        }
    }
}

#Preview {
    AlarmRow(alarm: Alarm(time: Date.now, label: "Testing"))
}

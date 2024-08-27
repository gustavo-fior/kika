//
//  ContentView.swift
//  Kika
//
//  Created by Gustavo Fior on 26/08/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
            TabView {
                AlarmListView()
                    .tabItem {
                        Image(systemName: "alarm")
                        
                    }
                SettingsView()
                    .tabItem {
                        Image(systemName: "gear")
                        
                    }
            }
        }
}

#Preview {
    ContentView()
        .modelContainer(for: Alarm.self, inMemory: true)
}

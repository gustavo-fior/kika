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
        .onAppear {
            // Customize tab bar appearance
            let appearance = UITabBarAppearance()
            appearance.stackedLayoutAppearance.normal.iconColor = .gray
            appearance.stackedLayoutAppearance.selected.iconColor = .black
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Alarm.self, inMemory: true)
}

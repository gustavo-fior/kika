import SwiftUI
import SwiftData

struct AlarmListView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query private var alarms: [Alarm]
    @State private var showingAddAlarm = false
    
    var body: some View {
        NavigationView {
            Group {
                if alarms.isEmpty {
                    VStack {
//                        Image(.yoga)
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .padding()
//                            .frame(width: 280)
//                            .padding(.bottom, 16)
                        Image(systemName: "bell.slash.fill")
                            .font(.system(size: 64))
                            .padding(.bottom, 16)
                        Text("Not much going on here...")
                            .foregroundColor(.gray)
                            .padding(.bottom, 16)
                            .italic()
                        Button(action: {showingAddAlarm = true}) {
                            Text("Create an alarm")
                                .padding()
                                .background(Color.primary)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                                .bold()
                        }
                    }
                } else {
                    List {
                        ForEach(alarms) { alarm in
                            AlarmRow(alarm: alarm)
                        }
                        .onDelete(perform: deleteAlarms)
                    }
                }
            }
            .navigationTitle("Alarms")
            .toolbar {
                Button(action: {showingAddAlarm = true}) {
                    Image(systemName: "plus")
                        .foregroundColor(.primary)
                }
            }
        }
        .sheet(isPresented: $showingAddAlarm) {
            NewAlarmView()
        }
    }
    
    private func deleteAlarms(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(alarms[index])
            }
        }
    }
}

#Preview {
    AlarmListView()
}

import SwiftUI

struct AlarmListView: View {
    @State private var alarms: [Alarm] = []
    @State private var showingAddAlarm = false
    
    var body: some View {
        NavigationView {
            Group {
                if alarms.isEmpty {
                    VStack {
                        Image(.yoga)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                            .frame(width: 280)
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
                    List(alarms) { alarm in
                        Image(systemName: "clock")
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
}

#Preview {
    AlarmListView()
}

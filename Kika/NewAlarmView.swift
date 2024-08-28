import SwiftUI

struct NewAlarmView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var time = Date()
    @State private var label = ""
    @State private var isEnabled = true
    @State private var repeatDays: Set<Int> = []
    let daysOfWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Time", selection: $time, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                
                VStack(alignment: .leading) {
                    Text("Label")
                        .padding(.top)
                        .padding(.leading, 6)
                    TextField("Wake wake", text: $label)
                        .padding()
                        .background(.regularMaterial)
                        .cornerRadius(12)
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("Add Alarm")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                trailing: Button(action: {dismiss()}) {
                    Image(systemName: "xmark")
                        .foregroundColor(.primary)
                        .font(.caption)
                        .bold()
                }
            )
        }
        
    }
    
    private func toggleDay(_ day: Int) {
        if repeatDays.contains(day) {
            repeatDays.remove(day)
        } else {
            repeatDays.insert(day)
        }
    }
    
    private func saveAlarm() {
        let newAlarm = Alarm(
            time: time,
            label: label,
            repeatDays: Array(repeatDays).sorted()
        )
        modelContext.insert(newAlarm)
        dismiss()
    }
}

#Preview {
    NewAlarmView()
}

//
//  ContentView.swift
//  UserDefault
//
//  Created by wannabewize on 12/3/23.
//

import SwiftUI

struct ContentView: View {
    @State var title: String = "알람 - 123"
    @State var date: Date = Date()
    @State var notify: Bool = false
    @State var volume: Double = 0.5
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Spacer()
                Button("읽기") {
                    let setting = UserDefaults.standard

                    if let title = setting.string(forKey: "TITLE"),
                        let date = setting.value(forKey: "DATE") as? Date,
                       let notify = setting.value(forKey: "NOTIFY") as? Bool,
                       let volume = setting.value(forKey: "VOLUME") as? Double {
                        
                        self.title = title
                        self.date = date
                        self.notify = notify
                        self.volume = volume
                    }
                    else {
                        print("Something wrong")
                    }
                }
                
                Button("저장") {
                    let setting = UserDefaults.standard
                    setting.setValue(date, forKey: "DATE")
                    setting.setValue(notify, forKey: "NOTIFY")
                    setting.setValue(volume, forKey: "VOLUME")
                    setting.setValue(title, forKey: "TITLE")
                    
                    print("Success")
                }
            }
            
            HStack(spacing: 30) {
                Text("이름")
                TextField("이름", text: $title)
            }
            
            DatePicker("Date", selection: $date)
                .pickerStyle(.inline)
                
            Toggle("미리 알림", isOn: $notify)
            
            HStack(spacing: 30) {
                Text("음량(\(String(format: "%0.1f", volume)))")
                
                Slider(value: $volume, in: 0.0...1.0) {
                    Text("\(volume)")
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

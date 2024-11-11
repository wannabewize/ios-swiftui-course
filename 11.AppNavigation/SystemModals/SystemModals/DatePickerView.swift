//
//  DatePickerView.swift
//  SystemModals
//
//  DatePickerStyle
//  - graphical : date의 경우 inline, hourAndMinute의 경우 popup
//  - compact : popup
//  - wheel : inline
//  - automatic
//

import SwiftUI

struct DatePickerView: View {
    @State var selectedDate1 = Date()
    @State var selectedDate2 = Date()
    @State var selectedDate3 = Date()
    
    var body: some View {
        VStack(spacing: 20) {
            DatePicker("날짜 선택(graphical)", selection: $selectedDate1, displayedComponents: .date)
                .datePickerStyle(.graphical)

            DatePicker("시간 선택(compact)", selection: $selectedDate2, displayedComponents: .hourAndMinute)
                .datePickerStyle(.compact)
            
            DatePicker("wheel", selection: $selectedDate3)
                .datePickerStyle(.wheel)
            
        }
        .padding()
    }
}

#Preview {
    DatePickerView()
}

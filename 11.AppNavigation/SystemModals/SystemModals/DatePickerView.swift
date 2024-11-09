//
//  DatePickerView.swift
//  SystemModals
//
//  Created by Jaehoon Lee on 11/10/24.
//

import SwiftUI

struct DatePickerView: View {
    @State var date1 = Date()
    var body: some View {
        VStack(spacing: 20) {
            DatePicker("날짜 선택", selection: $date1, displayedComponents: .date)
                .datePickerStyle(.automatic)
        }
        .padding()
    }
}

#Preview {
    DatePickerView()
}

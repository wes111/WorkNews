//
//  DatePickerView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 8/14/22.
//

import SwiftUI

struct DatePickerView: View {
    
    @Binding var userDate: Date
    var title: String
    
    var body: some View {
        DatePicker(title,
                   selection: $userDate,
                   displayedComponents: [.date, .hourAndMinute]
        )
        .datePickerStyle(.graphical)
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView(userDate: .constant(Date()), title: "Date Picker")
    }
}

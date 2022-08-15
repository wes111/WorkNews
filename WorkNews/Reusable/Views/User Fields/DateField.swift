//
//  DateField.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 8/14/22.
//

import SwiftUI

struct DateField<T: UserFillable>: View {
    
    @State private var calendarIsVisible = false
    @Binding var userDate: Date

    let currentDate = Date()
    private let field: T
    private let dateFormatter = DateFormatter()
    
    init(_ field: T, userDate: Binding<Date>) {
        self.field = field
        self._userDate = userDate
        dateFormatter.dateFormat = "MMMM dd yyyy"
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            UserFieldHeaders(title: field.title, subtitle: field.subtitle)
            
            VStack {
                Button {
                    self.calendarIsVisible.toggle()
                } label: {
                    HStack {
                        if userDate == currentDate {
                            Text("Select a Date")
                        } else {
                            Text(userDate.createEventDate() ?? "Error displaying date")
                        }
                        
                        Spacer()
                        
                        Image(systemName: calendarIsVisible ? "chevron.up" : "chevron.down")
                    }
                    .padding(16)
                }
                .padding(.top, 2)
                
                if calendarIsVisible { // Display calendar
                    VStack {
                        Divider()
                            .padding(.top, -10)
                        
                        DatePickerView(userDate: $userDate, title: "Date")
                    }
                }
            }
            .overlay(
            RoundedRectangle(cornerRadius: 2)
                .stroke(Color.black, lineWidth: 2)
        )
        }
    }
}

struct DateField_Previews: PreviewProvider {
    static var previews: some View {
        DateField(EventField.beginDate,
                  userDate: .constant(Date())
        )
    }
}

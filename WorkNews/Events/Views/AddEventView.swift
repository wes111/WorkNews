//
//  AddEventView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 8/13/22.
//

import SwiftUI

struct AddEventView: View {
    
    @FocusState private var focusedField: EventField?
    @State var userText: String = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                NextFocusField(EventField.title, userText: $userText, _focusedField)
                HStack(alignment: .top, spacing: 10) {
                    NextFocusField(EventField.city, userText: $userText, _focusedField)
                    
                    MenuField(field: EventField.state,
                              menuItems: USState.allCases.map { $0.name },
                              menuItemWidth: 150)
                    
                }
            }
        }
        .padding()
    }
}

// MARK: - Preview

struct AddEventView_Previews: PreviewProvider {
    static var previews: some View {
        AddEventView()
    }
}


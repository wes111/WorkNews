//
//  UserTextField.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 8/13/22.
//

import SwiftUI

struct UserTextField<T: UserFillable>: View {
    
    @Binding var userText: String
    let field: T
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            UserFieldHeaders(title: field.title, subtitle: field.subtitle)
                .padding(.bottom, 10)
            
            TextField(field.defaultText ?? "", text: $userText)
                .keyboardType(field.keyboardType)
                .onChange(of: userText) { newValue in
                    self.userText = field.format(newValue)
                }
                .modifier(TextFieldClearButton(text: $userText))
                .font(.create(Gotham.light(size: 14)))
                .padding(.bottom, 2)
                .frame(height: 20)
            
            Divider()
                .frame(height: 1)
                .overlay(Color.softYellow)
        }
    }
}

// MARK: - Preview

struct UserTextField_Previews: PreviewProvider {
    static var previews: some View {
        UserTextField(userText: .constant("bob"), field: EventField.title)
    }
}

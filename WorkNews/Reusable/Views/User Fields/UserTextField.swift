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
        VStack(alignment: .leading) {
            
            UserFieldHeaders(title: field.title, subtitle: field.subtitle)
            
            TextField(field.defaultText ?? "", text: $userText)
                .keyboardType(field.keyboardType)
                .padding(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(field.validate(userText) ? Color.softYellow : Color.red)
                )
                .onChange(of: userText) { newValue in
                    self.userText = field.format(newValue)
                }
        }
    }
}

// MARK: - Preview

struct UserTextField_Previews: PreviewProvider {
    static var previews: some View {
        UserTextField(userText: .constant("bob"), field: EventField.title)
    }
}

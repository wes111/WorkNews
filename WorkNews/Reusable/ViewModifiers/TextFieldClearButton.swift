//
//  TextFieldClearButton.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 8/24/22.
//

import SwiftUI

// Adds a 'clear input' button to the right side of a TextField.
struct TextFieldClearButton: ViewModifier {
    
    @Binding var text: String
    
    func body(content: Content) -> some View {
        HStack {
            content
            if !text.isEmpty {
                Button {
                    self.text = ""
                } label: {
                    Image(systemName: "multiply.circle.fill")
                        .foregroundColor(.softYellow)
                }
            }
        }
    }
}

// MARK: - Preview
struct TextFieldClearButton_Previews: PreviewProvider {
    static var previews: some View {
        TextField("Text Field w/ Clear Button", text: .constant("user text"))
    }
}

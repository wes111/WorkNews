//
//  NextFocusField.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 8/13/22.
//

import SwiftUI

// Creates a UserTextField with a return key "Next" on the keyboard
// and makes this view targetable as a focusedField.
// Note: For non-default keyboards, a return key might not exist.
struct NextFocusField<T: UserFillable>: View {
    @Binding var userText: String
    @FocusState var focusedField: T?
    let field: T
    
    init(_ field: T, userText: Binding<String>, _ focusedField: FocusState<T?>) {
        self.field = field
        self._userText = userText
        self._focusedField = focusedField
    }
    
    var body: some View {
        UserTextField(userText: $userText, field: field)
            .focused($focusedField, equals: field)
            .submitLabel(.next)
    }
}

// MARK: - Preview

//struct NextFocusField_Previews: PreviewProvider {
//
//    struct NextFocusFieldPreview: View {
//        @FocusState var focusedField: Type?
//
//        var body: some View {
//            NextFocusField(Type.firstName, userText: .constant(""), _focusedField)
//        }
//    }
//
//    static var previews: some View {
//        NextFocusFieldPreview()
//    }
//}

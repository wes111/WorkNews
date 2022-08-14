//
//  SecondaryButton.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 8/13/22.
//

import SwiftUI

struct SecondaryButton: View {
    @Binding var buttonColor: Color
    let title: String
    let buttonTappedAction: () -> Void
    
    var body: some View {
        Button {
            buttonTappedAction()
        } label: {
            VStack(spacing: 5.25) {
                Text(title)
                Divider()
                    .frame(height: 3)
                    .overlay(buttonColor)
            }
        }
        .fixedSize(horizontal: true, vertical: false)
    }
}

struct SecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        SecondaryButton(buttonColor: .constant(.blue), title: "BACK") {
            return
        }
    }
}

//
//  PrimaryButton.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 8/13/22.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    let buttonTappedAction: () -> Void
    
    var body: some View {
        Button {
            buttonTappedAction()
        } label: {
            HStack {
                Spacer()
                Text(title)
                Spacer()
            }
            .contentShape(Rectangle())
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 15)
        .foregroundColor(.white)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(title: "SAVE") {
            return
        }
    }
}

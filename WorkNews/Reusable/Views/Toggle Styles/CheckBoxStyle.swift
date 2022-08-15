//
//  CheckBoxStyle.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 8/14/22.
//

import SwiftUI

struct CheckBoxStyle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        return HStack(alignment: .center) {
            Label {
                configuration.label
            } icon: {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .resizable()
                    .frame(width: 28, height: 28)
                    .onTapGesture { configuration.isOn.toggle() }
            }
        }
    }
}


struct CheckBoxStyle_Previews: PreviewProvider {
    
    struct CheckBoxStylePreview: View {
        @State var checked = false
        var body: some View {
            Toggle(isOn: $checked) {
                Text("Set as on.")
            }
            .toggleStyle(CheckBoxStyle())
        }
        
    }
    
    static var previews: some View {
        CheckBoxStylePreview()
    }
}

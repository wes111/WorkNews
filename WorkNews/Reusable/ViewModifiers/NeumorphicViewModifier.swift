//
//  NeumorphicViewModifier.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/16/22.
//

import SwiftUI

struct Neumorphic: ViewModifier {
   
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                
                .stroke(LinearGradient.darkBorderGradient,
                        lineWidth: 1)
            )
            .background(Color(.white))
            .cornerRadius(10)
            
            .shadow(
                color: Color(white: 1.0).opacity(0.9),
                radius: 3,
                x: -3,
                y: -3)
            .shadow(
                color: Color.gray.opacity(0.7),
                radius: 3,
                x: 3,
                y: 3)
    }
}

// MARK: - Preview
struct NeumorphicVM_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Hello World")
                .padding()
        }
        .modifier(Neumorphic())
        .padding()
    }
}

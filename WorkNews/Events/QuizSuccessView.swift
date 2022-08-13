//
//  QuizSuccessView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 8/13/22.
//

import SwiftUI

// The final View displayed in QuizView.
struct QuizSuccessView: View {
    @Binding var isShowingParentView: Bool
    
    var body: some View {
        VStack {
            // Close Button
            HStack {
                Spacer()
                Button {
                    isShowingParentView = false
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 16, height: 16)
                }
            }
            .padding(.bottom, 100)
            
            Text("Success!")
                .padding(.bottom, 69)
            
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 84)
                .padding(.bottom, -5)
            
            Text("Your Preferences Have Been Saved.")
                .padding(.bottom, 44)
                .frame(width: 240)
            
            Spacer()
        }
        .multilineTextAlignment(.center)
        .navigationBarHidden(true)
        .padding(20)
    }
}

// MARK: - Preview

struct QuizSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        QuizSuccessView(isShowingParentView: .constant(true))
    }
}

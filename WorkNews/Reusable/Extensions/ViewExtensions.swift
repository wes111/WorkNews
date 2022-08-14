//
//  ViewExtensions.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/19/22.
//

import SwiftUI

extension View {
    // Hides and unhides view based on value of isHidden.
    
    @ViewBuilder func isHidden (_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}

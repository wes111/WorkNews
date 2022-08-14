//
//  LinearGradientExtensions.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/16/22.
//

import Foundation
import SwiftUI

extension LinearGradient {
    
    public static var darkBorderGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [.white, Color(UIColor(red: 0.592, green: 0.651, blue: 0.710, alpha: 1.000))]),
            startPoint: UnitPoint(x: -0.2, y: 0.5),
            endPoint: .bottomTrailing)
    }
}

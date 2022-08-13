//
//  Quizzable.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 8/13/22.
//

import Foundation

// The Quizzable protocol is intended to be adopted by quiz models so that they
// may be used in the QuizView.
protocol Quizzable where Self: Advanceable & RawRepresentable, RawValue == String {
    var isLast: Bool { get }
    var isFirst: Bool { get }
    var optionsInfo: [OptionInfo] { get }
    
    static func getFirst() -> Self
}

extension Quizzable {
    
    static func getFirst() -> Self {
        return Self.allCases[Self.allCases.startIndex]
    }
    
    var isLast: Bool {
        return Self.allCases.index(after: index) == Self.allCases.endIndex
    }
    
    var isFirst: Bool {
        return index == Self.allCases.startIndex
    }
}

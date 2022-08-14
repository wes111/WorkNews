//
//  Advanceable.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 8/13/22.
//

import Foundation

protocol Advanceable: CaseIterable, Equatable {
    func advance() -> Self
    
    var index: Self.AllCases.Index { get }
}

extension Advanceable {
    // Circular 'advance to next object.'
    func advance() -> Self {
        let allCases = Self.allCases
        let next = allCases.index(after: index)
        return allCases[next == allCases.endIndex ? allCases.startIndex : next]
    }
    
    // The index of self.
    var index: Self.AllCases.Index {
        return Self.allCases.firstIndex(of: self)!
    }
}

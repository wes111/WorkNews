//
//  IntExtensions.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/21/22.
//

import Foundation

extension Int {
    
    func getThird(position: Int) -> Int {
        if position == 0 {
            return 0
        } else {
            if self % 3 < position {
                return self / 3 + getThird(position: position - 1)
            } else {
                return (self / 3) + 1 + getThird(position: position - 1)
            }
        }
        
    }
}

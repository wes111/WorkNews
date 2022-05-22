//
//  IntExtensions.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/21/22.
//

import Foundation

extension Int {
    
    // Returns the end index for the specified division,
    // where a division is the the 1st, 2nd, or 3rd element.
    // Any remainder is added in increments of 1 from the lowest
    // to the highest division.
    func getEndIndexWhenDividedIntoThirds(forDivision division: Int) -> Int {
        if division == 0 {
            return 0
        } else {
            if self % 3 < division {
                return (self / 3) + getEndIndexWhenDividedIntoThirds(forDivision: division - 1)
            } else {
                return (self / 3) + 1 + getEndIndexWhenDividedIntoThirds(forDivision: division - 1)
            }
        }
        
    }
}

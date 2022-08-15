//
//  DateExtensions.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 8/14/22.
//

import Foundation

extension Date {
    
    // Returns the date in the String format: "January 1st 2022"
    // Returns nil if the conversion from Date to String fails.
    // Modified from: https://stackoverflow.com/questions/31546621/display-date-in-st-nd-rd-and-th-format
    func createEventDate() -> String? {
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .ordinal
        numberFormatter.locale = Locale.current
        let dateFormatter = DateFormatter()
        
        // Create the ordinal day String.
        dateFormatter.dateFormat = "dd"
        let dayString = dateFormatter.string(from: self)
        guard let dayInt = Int(dayString) else { return nil }
        let dayNSNumber = NSNumber(value: dayInt)
        guard let ordinalDayString = numberFormatter.string(from: dayNSNumber) else { return nil }
        
        // Create the month String.
        dateFormatter.dateFormat = "MMMM"
        let monthString = dateFormatter.string(from: self)
        
        // Create the year String
        dateFormatter.dateFormat = "yyyy"
        let yearString = dateFormatter.string(from: self)
        
        return "\(monthString) \(ordinalDayString) \(yearString)"
    }
}

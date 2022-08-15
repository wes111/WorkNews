//
//  Event.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 8/13/22.
//

import SwiftUI

struct Event {
    let id: String
    let title: String
    let dateTime: String
    let location: String
}

enum EventField: String, UserFillable {

    case title = "Event Title"
    case city = "City"
    case state = "State"
    case description = "Description"
    case beginDate = "Beginning Date"
    case endDate = "Ending Date"
    case streetAddress = "Street Address"
    case unitAddress = "Apt or Unit"
    case zipcode = "Zip code"
    case organizer = "Organizer"
    case contactEmail = "Contact Email"
    case details = "Additional Details"
    
    var title: String {
        return self.rawValue
    }
    
    var subtitle: String? {
        switch self {
        default: return nil
        }
    }
    
    // Default text displayed if a user has not
    // yet made a selection.
    var defaultText: String? {
        switch self {
        default: return nil
        }
    }
    
    var keyboardType: UIKeyboardType {
        switch self {
        default: return .default
        }
    }
    
    // A closure to format the user's input
    var format: (String) -> String {
        switch self {
        default: return { $0 }
        }
    }
    
    // A closure to validate the user's input.
    var validate: (String) -> Bool {
        switch self {
        default: return { !$0.isEmpty }
        }
    }
}


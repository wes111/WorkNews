//
//  UserFieldHeaders.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 8/13/22.
//

import SwiftUI

// The title and subtitle for a UserField.
struct UserFieldHeaders: View {
    let title: String
    let subtitle: String?
    
    var body: some View {
        Text(title)
            .padding(.bottom, subtitle == nil ? -2 : -8)
        
        if let subtitle = subtitle {
            Text(subtitle)
        }
    }
}

struct UserFieldHeaders_Previews: PreviewProvider {
    static var previews: some View {
        UserFieldHeaders(title: "Title", subtitle: "Subtitle")
    }
}

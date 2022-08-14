//
//  UserFillable.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 8/13/22.
//

import SwiftUI

protocol UserFillable: Hashable, Advanceable {
    var title: String { get }
    var subtitle: String? { get }
    var defaultText: String? { get }
    var keyboardType: UIKeyboardType { get }
    var format: (String) -> String { get }
    var validate: (String) -> Bool { get }
}

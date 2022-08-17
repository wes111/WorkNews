//
//  FontExtensions.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 8/16/22.
//

import SwiftUI

protocol FontFamily {
    var name: String { get }
    var size: CGFloat { get }
}

extension Font {
    
    static func create(_ font: FontFamily) -> Font {
        Font.custom(font.name, size: font.size)
    }
}

//
//  Gotham.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 8/16/22.
//

import SwiftUI

// The Gotham FontFamily, represents 9 fonts.
enum Gotham: FontFamily {
    
    // The associated value is the font size.
    case black(size: CGFloat)
    case bold(size: CGFloat)
    case bookItalic(size: CGFloat)
    case light(size: CGFloat)
    case thin(size: CGFloat)
    case thinItalic(size: CGFloat)
    case ultraItalic(size: CGFloat)
    case xLight(size: CGFloat)
    case xLightItalic(size: CGFloat)
    
    // The name of the font, matches the file name.
    var name: String {
        switch self {
        case .black: return "Gotham-Black"
        case .bold: return "Gotham-Bold"
        case .bookItalic: return "Gotham-BookItalic"
        case .light: return "Gotham-Light"
        case .thin: return "Gotham-Thin"
        case .thinItalic: return "Gotham-ThinItalic"
        case .ultraItalic: return "Gotham-UltraItalic"
        case .xLight: return "Gotham-XLight"
        case .xLightItalic: return "Gotham-XLightItalic"
        }
    }
    
    // Return the font size from the associated value.
    var size: CGFloat {
        switch self {
        case .black(let size), .bold(let size), .bookItalic(let size), .light(let size),
                .thin(let size), .thinItalic(let size), .ultraItalic(let size), .xLight(let size),
                .xLightItalic(let size): return size
        }
    }
}

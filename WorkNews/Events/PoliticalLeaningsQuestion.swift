//
//  PoliticalLeaningsQuestion.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 8/13/22.
//

import SwiftUI

protocol CarouselQuestion where Self: Advanceable & RawRepresentable, RawValue == String {
    var isLast: Bool { get }
    var isFirst: Bool { get }
    var tilesInfo: [TileInfo] { get }
    
    static func getFirst() -> Self
}

extension CarouselQuestion {
    
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

struct TileInfo {
    let categoryName: String
    let imageName: String
    let borderColor: Color
}

enum PoliticalLeaningsQuestion: String, CarouselQuestion {
    
    case environment
    case weed
    case politician
    
    var tilesInfo: [TileInfo] {
        switch self {
        case .environment:
            return [
                TileInfo(categoryName: "No Fossil Fuels", imageName: "", borderColor: .yellow),
                TileInfo(categoryName: "Diesel Trucks!!", imageName: "", borderColor: .yellow),
                TileInfo(categoryName: "Burn the Planet", imageName: "", borderColor: .yellow)
        ]
            
        case .weed:
            return [
                TileInfo(categoryName: "Lets smoke bro", imageName: "", borderColor: .yellow),
                TileInfo(categoryName: "smoke free zone", imageName: "", borderColor: .yellow),
                TileInfo(categoryName: "Hippies!", imageName: "", borderColor: .yellow)
            ]
            
        case .politician:
            return [
                TileInfo(categoryName: "Obama", imageName: "", borderColor: .yellow),
                TileInfo(categoryName: "Trump", imageName: "", borderColor: .yellow),
                TileInfo(categoryName: "Sanders", imageName: "", borderColor: .yellow)
            ]
        }
    }
    
}

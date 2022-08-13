//
//  PoliticalLeaningsQuestion.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 8/13/22.
//

import SwiftUI

enum PoliticsQuiz: String, Quizzable {
    
    case environment = "How do you feel about the environment?"
    case weed = "How do you feel about weed?"
    case politician = "How do you feel about politicians?"
    
    var optionsInfo: [OptionInfo] {
        switch self {
        case .environment:
            return [
                OptionInfo(title: "No Fossil Fuels", imageName: "", borderColor: .yellow),
                OptionInfo(title: "Diesel Trucks!!", imageName: "", borderColor: .yellow),
                OptionInfo(title: "Burn the Planet", imageName: "", borderColor: .yellow)
        ]
            
        case .weed:
            return [
                OptionInfo(title: "Lets smoke bro", imageName: "", borderColor: .yellow),
                OptionInfo(title: "smoke free zone", imageName: "", borderColor: .yellow),
                OptionInfo(title: "Hippies!", imageName: "", borderColor: .yellow)
            ]
            
        case .politician:
            return [
                OptionInfo(title: "Obama", imageName: "", borderColor: .yellow),
                OptionInfo(title: "Trump", imageName: "", borderColor: .yellow),
                OptionInfo(title: "Sanders", imageName: "", borderColor: .yellow)
            ]
        }
    }
}

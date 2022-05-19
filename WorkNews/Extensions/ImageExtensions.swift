//
//  ImageExtensions.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/18/22.
//

import SwiftUI

extension Image {
    
    func modify(using style: ImageStyle) -> some View {
        return self
            .resizable()
            .scaledToFill()
            .frame(width: style.size.width,
                   height: style.size.height)
            .clipped()
            //.cornerRadius(5)
    }
}



//
//  AsyncImageView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/18/22.
//

import SwiftUI

enum ImageStyle {
    case book
    case systemForward
    
    var size: CGSize {
        switch self {
        case .book:
            return CGSize(width: 98, height: 154)
        case .systemForward: // 36 x 30
            return CGSize(width: 18, height: 15)
        }
    }
}

struct AsyncImageView: View {
    
    let link: String?
    let style: ImageStyle
    let tryAgain: Bool
    
    var errorImage: some View {
        Image(systemName: "photo")
            .frame(width: style.size.width,
                   height: style.size.height)
    }
    
    var body: some View {
        if let link = link,
           let imageURL = URL(string: link) {
            AsyncImage(url: imageURL) { phase in
                
                if let image = phase.image { // Displays the loaded image.
                    image
                        .modify(using: style)
                } else if phase.error != nil { // Indicates an error.
                    if tryAgain {
                        AsyncImageView(link: link, style: style, tryAgain: false)
                    } else { // If a loading error has occurred twice.
                        errorImage
                    }
                } else { // Placeholder.
                    ProgressView()
                        .progressViewStyle(.circular)
                        .frame(width: style.size.width,
                               height: style.size.height)
                }
            }
        } else {
            errorImage
        }
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView(link: nil, style: .book, tryAgain: false)
    }
}

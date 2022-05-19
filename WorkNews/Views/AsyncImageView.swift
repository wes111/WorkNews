//
//  AsyncImageView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/18/22.
//

import SwiftUI

enum ImageStyle {
    case book
    
    var size: CGSize {
        switch self {
        case .book:
            return CGSize(width: 98, height: 154)
        }
    }
}

struct AsyncImageView: View {
    
    let link: String?
    let style: ImageStyle
    
    var body: some View {
        if let link = link,
           let imageURL = URL(string: link) {
            AsyncImage(
                url: imageURL,
                content: { image in
                    image.modify(using: style)
                },
                placeholder: {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .frame(width: style.size.width,
                               height: style.size.height)
                }
            )
        } else {
            Image(systemName: "photo")
                .frame(width: style.size.width,
                       height: style.size.height)
        }
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView(link: nil, style: .book)
    }
}

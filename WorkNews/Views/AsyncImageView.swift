//
//  AsyncImageView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/18/22.
//

import SwiftUI

enum ImageStyle {
    case bookCard
    case songCard
    case movieCard // 342 X 513
    case bookDetail
    case songDetail
    case movieDetail
    case systemForward
    
    var size: CGSize {
        switch self {
        case .bookCard:
            return CGSize(width: BookConstants.bookCardWidth, height: 154)
        case .songCard:
            return CGSize(width: SongConstants.songCardWidth, height: SongConstants.songCardWidth)
        case .movieCard:
            return CGSize(width: MovieConstants.movieCardWidth, height: 513.0 / 3)
        case .bookDetail:
            return CGSize(width: 196, height: 308)
        case .songDetail:
            return CGSize(width: 250, height: 250)
        case .movieDetail:
            return CGSize(width: MovieConstants.movieCardWidth * 2, height: (513.0 / 3) * 2)
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
        AsyncImageView(link: nil, style: .bookCard, tryAgain: false)
    }
}

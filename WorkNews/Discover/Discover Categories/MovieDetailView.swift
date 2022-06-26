//
//  MovieDetailView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 6/25/22.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movie: Movie
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImageView(link: movie.moviePosterURL, style: .movieDetail, tryAgain: true)
                    .padding()
                Text(movie.title)
                Text(movie.description)
                Text(movie.releaseDate)
            }
        }
    }
}

//struct MovieDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailView()
//    }
//}

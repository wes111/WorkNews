//
//  MovieCard.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/16/22.
//

import SwiftUI

struct MovieCard: View {
    
    let movie: Movie
    
    var body: some View {
        VStack {
            NavigationLink(destination: MovieDetailView(movie: movie)) {
                movie.asyncImage
            }
        }
    }
}

//struct MovieCard_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieCard(movie: Movie(image: Image(systemName: "film")))
//    }
//}

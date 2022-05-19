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
        movie.image
            .resizable()
            .frame(width: 51, height: 66)
    }
}

struct MovieCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieCard(movie: Movie(image: Image(systemName: "film")))
    }
}

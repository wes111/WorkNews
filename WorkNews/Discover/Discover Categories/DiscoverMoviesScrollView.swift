//
//  DiscoverMoviesScrollView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/16/22.
//

import SwiftUI

struct DiscoverMoviesScrollView: View {
    let moviesArray =
    [
        Movie(image: Image(systemName: "film")),
        Movie(image: Image(systemName: "film")),
        Movie(image: Image(systemName: "film")),
        Movie(image: Image(systemName: "film")),
        Movie(image: Image(systemName: "film")),
        Movie(image: Image(systemName: "film")),
        Movie(image: Image(systemName: "film")),
        Movie(image: Image(systemName: "film")),
        Movie(image: Image(systemName: "film")),
        Movie(image: Image(systemName: "film"))
    ]
        
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(moviesArray) { movie in
                    MovieCard(movie: movie)
                        .padding(.leading, 10)
                }
            }
        }
    }
}

struct DiscoverMoviesScrollView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverMoviesScrollView()
    }
}

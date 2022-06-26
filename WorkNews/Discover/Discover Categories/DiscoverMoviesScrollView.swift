//
//  DiscoverMoviesScrollView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/16/22.
//

import SwiftUI

struct DiscoverMoviesScrollView: View {

    @ObservedObject var model: MoviesViewModel
    private let itemCount = 10
        
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<itemCount, id: \.self) { index in
                    if model.moviesList.count > index {
                        MovieCard(movie: model.moviesList.elements[index].value)
                    }
                }
            }
        }
    }
}

//struct DiscoverMoviesScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        DiscoverMoviesScrollView()
//    }
//}

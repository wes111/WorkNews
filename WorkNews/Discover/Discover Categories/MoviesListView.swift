//
//  MoviesListView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 6/25/22.
//

import SwiftUI

struct MoviesListView: View {
    var model: MoviesViewModel
    
    let columns = [
        GridItem(.adaptive(minimum: SongConstants.songCardWidth), spacing: 10)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(0..<model.moviesList.count, id: \.self) { index in
                    MovieCard(movie: model.moviesList.elements[index].value)
                        .padding(.leading, 10)
                }
            }
        }
        .padding(20)
    }
}

//struct MoviesListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MoviesListView()
//    }
//}

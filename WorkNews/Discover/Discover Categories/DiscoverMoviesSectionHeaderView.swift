//
//  DiscoverMoviesSectionHeaderView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 6/25/22.
//

import SwiftUI

struct DiscoverMoviesSectionHeaderView: View {
    @ObservedObject var model: MoviesViewModel
    let title: String

    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
            Spacer()
            NavigationLink(destination: MoviesListView(model: model)) {
                Image(systemName: "arrow.forward")
                    .modify(using: .systemForward)
            }
        }
        .textCase(nil)
        .foregroundColor(.black)
    }
}

//struct DiscoverMoviesSectionHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        DiscoverMoviesSectionHeaderView()
//    }
//}

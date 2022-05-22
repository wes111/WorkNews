//
//  DiscoverBooksScrollView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/16/22.
//

import SwiftUI

struct DiscoverBooksScrollView: View {
    
    @ObservedObject var model: BooksViewModel
        
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach($model.discoverBookList) { $book in
                    BookCard(book: $book, fetcher: model.googleBookFetcher)
                        .padding(EdgeInsets(
                            top: 10,
                            leading: 10,
                            bottom: 10,
                            trailing: 0))
                }
            }
        }
    }
}

// MARK: - Preview
struct DiscoverBooksScrollView_Previews: PreviewProvider {
    
    struct DiscoverBooksScrollViewPreview: View {
        @ObservedObject var model = BooksViewModel()
        
        var body: some View {
            DiscoverBooksScrollView(model: model)
        }
    }
    static var previews: some View {
        DiscoverBooksScrollViewPreview()
    }
}

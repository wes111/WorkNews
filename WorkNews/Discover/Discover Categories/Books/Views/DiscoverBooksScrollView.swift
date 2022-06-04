//
//  DiscoverBooksScrollView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/16/22.
//

import SwiftUI

struct DiscoverBooksScrollView: View {
    
    @ObservedObject var model: BooksViewModel
    private let itemCount = 10
        
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<itemCount, id:\.self) { index in
                    if model.bookList.count > index {
                        BookCard(book: model.bookList.elements[index].value, fetcher: model.googleBookFetcher)
                    }
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

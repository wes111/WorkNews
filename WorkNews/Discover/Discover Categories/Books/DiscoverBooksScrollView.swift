//
//  DiscoverBooksScrollView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/16/22.
//

import SwiftUI

struct DiscoverBooksScrollView: View {
    
    @StateObject var model = BooksViewModel()
        
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(model.publishedBooks) { book in
                    BookCard(book: book)
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

struct DiscoverBooksScrollView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverBooksScrollView()
    }
}

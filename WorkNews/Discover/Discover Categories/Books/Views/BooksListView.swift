//
//  BooksListView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/19/22.
//

import OrderedCollections
import SwiftUI

struct BooksListView: View {
    
    @ObservedObject var model: BooksViewModel
    
    let columns = [
        GridItem(.adaptive(minimum: BookConstants.bookCardWidth), spacing: 10)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(0..<model.bookList.count, id:\.self) { index in
                    BookCard(book: model.bookList.elements[index].value, fetcher: model.googleBookFetcher)
                        .padding(.leading, 10)
                }
            }
        }
        .padding(20)
    }
}

// MARK: - Preview
struct BooksListView_Previews: PreviewProvider {
    
    struct BooksListViewPreview: View {
        @State var bookList: OrderedDictionary<String, Book> = [:]
        @State var model = BooksViewModel()
        
        var body: some View {
            BooksListView(model: model)
        }
    }
    
    static var previews: some View {
        BooksListViewPreview()
    }
}

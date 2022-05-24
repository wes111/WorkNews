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
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            HStack(alignment: .top) {
                createBookColumn(startIndex: 0, endIndex: model.bookList.count.getEndIndexWhenDividedIntoThirds(forDivision: 1))
                createBookColumn(startIndex: model.bookList.count.getEndIndexWhenDividedIntoThirds(forDivision: 1), endIndex: model.bookList.count.getEndIndexWhenDividedIntoThirds(forDivision: 2))
                createBookColumn(startIndex: model.bookList.count.getEndIndexWhenDividedIntoThirds(forDivision: 2), endIndex: model.bookList.count)
            }
        }
    }
    
    func createBookColumn(startIndex: Int, endIndex: Int) -> some View {
        VStack {
            ForEach(startIndex..<endIndex, id:\.self) { index in
                BookCard(book: model.bookList.elements[index].value, fetcher: model.googleBookFetcher)
                    .padding(EdgeInsets(
                        top: 10,
                        leading: 10,
                        bottom: 10,
                        trailing: 0))
            }
        }
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

//
//  BooksListView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/19/22.
//

import SwiftUI

struct BooksListView: View {
    
    @Binding var bookList: [Book]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            HStack(alignment: .top) {
                createBookColumn(startIndex: 0, endIndex: bookList.count.getEndIndexWhenDividedIntoThirds(forDivision: 1))
                createBookColumn(startIndex: bookList.count.getEndIndexWhenDividedIntoThirds(forDivision: 1), endIndex: bookList.count.getEndIndexWhenDividedIntoThirds(forDivision: 2))
                createBookColumn(startIndex: bookList.count.getEndIndexWhenDividedIntoThirds(forDivision: 2), endIndex: bookList.count)
            }
        }
    }
    
    func createBookColumn(startIndex: Int, endIndex: Int) -> some View {
        VStack {
            ForEach(startIndex..<endIndex, id:\.self) { index in
                BookCard(book: bookList[index])
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
        @State var bookList = [Book(GoogleBook(volumeInfo: GoogleBook.VolumeInfo(title: "The Dispossessed", subtitle: "An Ambiguous Dystopia", authors: ["Ursula K. Le Guin"], publishedDate: "1969", description: "An award-winning book", industryIdentifiers: nil, infoLink: nil, imageLinks: nil)))]
        
        var body: some View {
            BooksListView(bookList: $bookList)
        }
    }
    
    static var previews: some View {
        BooksListViewPreview()
    }
}

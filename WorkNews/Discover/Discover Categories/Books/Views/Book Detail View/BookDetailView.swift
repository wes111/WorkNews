//
//  BookDetailView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/21/22.
//

import SwiftUI

struct BookDetailView: View {
    
    let book: Book
    
    init(book: Book, fetcher: GoogleBookFetcher) {
        self.book = book
        if !book.hasReceivedUpdatedInfo {
            fetcher.getAdditionalBookDetails(id: book.id)
        }
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                
                BookTitleView(book: book)
                BookDescriptionView(book: book)
                
                VStack {
                    Text("Additional Details")
                        .font(.title3)
                    Text("ISBN-10: \(book.isbn10)")
                    Text("ISBN-13: \(book.isbn13)")
                    Link(destination: book.infoLink) {
                        Text("Tap for more info")
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .modifier(Neumorphic())
                
                Spacer()
            }
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.center)
            .padding()
        }
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView(book: Book(GoogleBook(id: "", volumeInfo: GoogleBook.VolumeInfo(title: "The Dispossessed", subtitle: "An Ambiguous Dystopia", authors: ["Ursula K. Le Guin"], publishedDate: "1969", description: "An award-winning book", industryIdentifiers: nil, infoLink: nil, imageLinks: nil)), shouldStripHTML: false), fetcher: GoogleBookFetcher())
    }
}

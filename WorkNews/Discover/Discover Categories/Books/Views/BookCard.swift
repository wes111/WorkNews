//
//  BookCard.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/16/22.
//

import SwiftUI

struct BookCard: View {
    
    @Binding var book: Book
    let fetcher: GoogleBookFetcher
        
    var body: some View {
        NavigationLink(destination: BookDetailView(book: book)) {
            VStack {
                book.asyncImage
            }
        }
        .simultaneousGesture(TapGesture().onEnded{
            self.fetcher.updateGoogleBook(id: book.id)
        })
    }
}

//struct BookCard_Previews: PreviewProvider {
//    static var previews: some View {
//        BookCard(book: Book(GoogleBook(id: "", volumeInfo: GoogleBook.VolumeInfo(title: "The Dispossessed", subtitle: "An Ambiguous Dystopia", authors: ["Ursula K. Le Guin"], publishedDate: "1969", description: "An award-winning book", industryIdentifiers: nil, infoLink: nil, imageLinks: nil))), fetcher: GoogleBookFetcher())
//    }
//}

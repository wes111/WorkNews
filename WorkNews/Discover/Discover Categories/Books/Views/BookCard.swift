//
//  BookCard.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/16/22.
//

import SwiftUI

struct BookCard: View {
    
    let book: Book
        
    var body: some View {
        VStack {
            book.asyncImage
        }
    }
}

struct BookCard_Previews: PreviewProvider {
    static var previews: some View {
        BookCard(book: Book(GoogleBook(volumeInfo: GoogleBook.VolumeInfo(title: "The Dispossessed", subtitle: "An Ambiguous Dystopia", authors: ["Ursula K. Le Guin"], publishedDate: "1969", description: "An award-winning book", industryIdentifiers: nil, infoLink: nil, imageLinks: nil))))
    }
}

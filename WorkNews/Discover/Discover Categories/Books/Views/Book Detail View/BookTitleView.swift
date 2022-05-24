//
//  TitleDetailView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/23/22.
//

import SwiftUI

struct BookTitleView: View {
    
    let book: Book
    
    var body: some View {
        VStack {
            AsyncImageView(link: book.imageLink, style: .bookDetail, tryAgain: true)
                .padding()
            
            Text(book.title)
                .font(.title2)
                .padding(.bottom, 5)
            Text("By: \(book.authors)")
                .padding(.bottom, 5)
            Text(book.publishedDate)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .modifier(Neumorphic())
    }
}

// MARK: - Preview
struct TitleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookTitleView(book: Book(GoogleBook(id: "", volumeInfo: GoogleBook.VolumeInfo(title: "The Dispossessed", subtitle: "An Ambiguous Dystopia", authors: ["Ursula K. Le Guin"], publishedDate: "1969", description: "An award-winning book", industryIdentifiers: nil, infoLink: nil, imageLinks: nil)), shouldStripHTML: false))
    }
}

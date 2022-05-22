//
//  BookDetailView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/21/22.
//

import SwiftUI

struct BookDetailView: View {
    
    let book: Book
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
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
                
                
                VStack {
                    Text(book.description)
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
        BookDetailView(book: Book(GoogleBook(id: "", volumeInfo: GoogleBook.VolumeInfo(title: "The Dispossessed", subtitle: "An Ambiguous Dystopia", authors: ["Ursula K. Le Guin"], publishedDate: "1969", description: "An award-winning book", industryIdentifiers: nil, infoLink: nil, imageLinks: nil)), shouldStripHTML: false))
    }
}

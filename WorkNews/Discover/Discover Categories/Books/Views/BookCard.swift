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

//struct BookCard_Previews: PreviewProvider {
//    static var previews: some View {
//        BookCard(book: Book(image: Image(systemName: "book.closed.fill")))
//    }
//}

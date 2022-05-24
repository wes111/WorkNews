//
//  BookDescriptionView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/23/22.
//

import SwiftUI

struct BookDescriptionView: View {
    
    @State var isShowingFullDescription = false
    let book: Book
    
    var body: some View {
        VStack {
            Text("Description:")
                .font(.title2)
            Button {
                isShowingFullDescription.toggle()
            } label: {
                Text("Expand")
            }
            Group {
                if !isShowingFullDescription {
                    Text(book.description)
                        .lineLimit(3)
                } else {
                    Text(book.description)
                }
            }
            .multilineTextAlignment(.leading)
            
        }
        .frame(maxWidth: .infinity)
        .padding()
        .modifier(Neumorphic())
    }
}

struct BookDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        BookDescriptionView(book: Book(GoogleBook(id: "", volumeInfo: GoogleBook.VolumeInfo(title: "The Dispossessed", subtitle: "An Ambiguous Dystopia", authors: ["Ursula K. Le Guin"], publishedDate: "1969", description: "An award-winning book", industryIdentifiers: nil, infoLink: nil, imageLinks: nil)), shouldStripHTML: false))
    }
}

//
//  Book.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/16/22.
//

import Foundation
import SwiftUI

struct Book: Identifiable {
    let id = UUID()
    
    let title: String
    let subtitle: String
    let authors: [String]
    let description: String
    let publishedDate: String
    let infoLink: String?
    let imageLink: String?
    let asyncImage: AsyncImageView
    
    init(_ googleBook: GoogleBook) {
        self.title = googleBook.volumeInfo.title ?? "Title Unavailable"
        self.subtitle = googleBook.volumeInfo.subtitle ?? ""
        self.authors = googleBook.volumeInfo.authors ?? ["Author Unavailable"]
        self.description = googleBook.volumeInfo.description ?? "Description Unavailable"
        self.publishedDate = googleBook.volumeInfo.publishedDate ?? "Published Date Unavailable"
        self.infoLink = googleBook.volumeInfo.infoLink
        self.imageLink = Book.getImageLink(from: googleBook.volumeInfo.imageLinks?.thumbnail)
        self.asyncImage = AsyncImageView(link: imageLink, style: .book)
    }
    
    // The image link provided by the Google Books API is not secure, i.e. the
    // link begins with "http" instead of "https". This function replaces "http"
    // with "https". AsyncImage silently fails (returns nil for content) if "http"
    // is used to fetch an image.
    static func getImageLink(from unsecureLink: String?) -> String? {
        guard let unsecureLink = unsecureLink else { return nil }
        
        if unsecureLink.count > 4 {
            let dropHTTPLink = unsecureLink.dropFirst(4)
            return "https" + dropHTTPLink
        } else {
            return unsecureLink
        }
        
    }
    
}

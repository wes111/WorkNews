//
//  Book.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/16/22.
//

import Foundation
import SwiftUI

struct Book: Identifiable {
    let id: String
    
    let title: String
    let authors: String
    let description: String
    let publishedDate: String
    let infoLink: URL
    let imageLink: String?
    let asyncImage: AsyncImageView
    var isbn10: String
    let isbn13: String
    var hasReceivedUpdatedInfo = false
    
    init(_ googleBook: GoogleBook, shouldStripHTML: Bool) {
        self.id = googleBook.id
        self.title = Book.createBookTitle(from: googleBook)
        self.authors = googleBook.volumeInfo.authors?.joined(separator: ", ") ?? "Author Unavailable"
        self.description = Book.createDescription(googleBook, shouldStripHTML: shouldStripHTML) ?? "Description Unavailable"
        self.publishedDate = Book.createPublishedDate(from: googleBook.volumeInfo.publishedDate)
        self.infoLink = URL(string: googleBook.volumeInfo.infoLink ?? "https://www.google.com")!
        self.imageLink = Book.createImageLink(googleBook)
        self.asyncImage = AsyncImageView(link: imageLink, style: .bookCard, tryAgain: true)
        self.isbn10 = Book.createISBN(googleBook, isbnIndex: 0) ?? "ISBN-10 Unavailable"
        self.isbn13 = Book.createISBN(googleBook, isbnIndex: 1) ?? "ISBN-13 Unavailable"
    }
    
    static func createImageLink(_ googleBook: GoogleBook) -> String? {
        var imageLink: String?
        if let link = googleBook.volumeInfo.imageLinks?.medium {
            imageLink = link
        } else if let link = googleBook.volumeInfo.imageLinks?.large {
            imageLink = link
        } else if let link = googleBook.volumeInfo.imageLinks?.small {
            imageLink = link
        } else if let link = googleBook.volumeInfo.imageLinks?.thumbnail {
            imageLink = link
        } else {
            imageLink = nil
        }
        return getSecureImageLink(from: imageLink)
    }
    
    static func createISBN(_ googleBook: GoogleBook, isbnIndex index: Int) -> String? {
        if googleBook.volumeInfo.industryIdentifiers?.count ?? 0 > index {
            return googleBook.volumeInfo.industryIdentifiers?[index].identifier
        } else {
            return nil
        }
    }
    
    static func createDescription(_ googleBook: GoogleBook, shouldStripHTML: Bool) -> String? {
        let description = googleBook.volumeInfo.description
        return shouldStripHTML ? description?.stripOutHtml() : description
    }
    
    
    static func createBookTitle(from googleBook: GoogleBook) -> String {
        guard let title = googleBook.volumeInfo.title, title != "" else {
            return "Title Unavailable"
        }
        guard let subtitle = googleBook.volumeInfo.subtitle, subtitle != "" else {
            return title
        }
        return "\(title): \(subtitle)"
    }
    
    static func createPublishedDate(from unformattedDate: String?) -> String {
        let defaultDate = "Published Date Unavailable"
        guard let date = unformattedDate, date != "" else {
            return defaultDate
        }
        let nsDate = NSString(string: date)
        let range = NSRange(location: 0, length: nsDate.length)
        let regex = try! NSRegularExpression(pattern: "[0-9]{4}")
        let result = regex.firstMatch(in: date, options: [], range: range)
        return result.map { nsDate.substring(with: $0.range) } ?? defaultDate
    }
    
    // The image link provided by the Google Books API is not secure, i.e. the
    // link begins with "http" instead of "https". This function replaces "http"
    // with "https". AsyncImage silently fails (returns nil for content) if "http"
    // is used to fetch an image.
    static func getSecureImageLink(from unsecureLink: String?) -> String? {
        guard let unsecureLink = unsecureLink else { return nil }
        
        if unsecureLink.count > 4 {
            let dropHTTPLink = unsecureLink.dropFirst(4)
            return "https" + dropHTTPLink
        } else {
            return unsecureLink
        }
        
    }
    
}

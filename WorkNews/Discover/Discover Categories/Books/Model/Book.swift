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
    let authors: String
    let description: String
    let publishedDate: String
    let infoLink: String?
    let imageLink: String?
    let asyncImage: AsyncImageView
    
    init(_ googleBook: GoogleBook) {
        self.title = Book.createBookTitle(from: googleBook)
        self.authors = googleBook.volumeInfo.authors?.joined(separator: ", ") ?? "Author Unavailable"
        self.description = googleBook.volumeInfo.description ?? "Description Unavailable"
        self.publishedDate = Book.createPublishedDate(from: googleBook.volumeInfo.publishedDate)
        self.infoLink = googleBook.volumeInfo.infoLink
        self.imageLink = Book.getImageLink(from: googleBook.volumeInfo.imageLinks?.thumbnail)
        self.asyncImage = AsyncImageView(link: imageLink, style: .bookCard, tryAgain: true)
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

//
//  GoogleBooksResponseModel.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/17/22.
//

import Foundation


struct GoogleBooksResponseModel: Decodable {
    let items: [GoogleBook]
}

struct GoogleBook: Decodable {
    let volumeInfo: VolumeInfo
    
    struct VolumeInfo: Decodable {
        let title: String?
        let subtitle: String?
        let authors: [String]?
        let publishedDate: String?
        let description: String?
        let industryIdentifiers: [Identifier]?
        let infoLink: String?
        let imageLinks: Images?
    }
    
    struct Identifier: Decodable {
        let type: String? // e.g. "ISBN_13" or "ISBN_10"
        let identifier: String?
    }
    
    struct Images: Decodable {
        let thumbnail: String?
    }
}


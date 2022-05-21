//
//  GoogleBookShelfResponseModel.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/19/22.
//

import Foundation


// Response model for information about a Google Bookshelf.
struct GoogleBookShelfResponseModel: Decodable {
    let id: Int
    let title: String
    let volumeCount: Int
}

//
//  StringExtensions.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/22/22.
//

import Foundation


extension String {
    
    func stripOutHtml() -> String? {
        do {
            guard let data = self.data(using: .unicode) else {
                return nil
            }
            let attributed = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            return attributed.string
        } catch {
            return nil
        }
    }
    
    
    // Returns a base64 representation of the current string.
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
}

//
//  SpotifyPlaylistResponseModel.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 6/20/22.
//

import Foundation

struct SpotifyPlaylistResponseModel: Decodable  {
    let tracks: Tracks
    
    struct Tracks: Decodable {
        let items: [Item]
        
        struct Item: Decodable {
            let track: Track
            
            struct Track: Decodable {
                let album: Album
                let name: String
                let artists: [Artist]
                
                struct Album: Decodable {
                    let images: [Image]
                    let name: String
                    let release_date: String
                    
                    struct Image: Decodable {
                        let url: String
                    }
                }
                
                struct Artist: Decodable {
                    let name: String
                }
            }
        }
    }
}

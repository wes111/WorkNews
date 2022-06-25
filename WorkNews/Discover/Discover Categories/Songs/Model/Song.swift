//
//  Song.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/16/22.
//

import Foundation
import SwiftUI

struct Song: Identifiable {
    let id: String
    let title: String
    let artists: String
    let imageLink: String
    let albumTitle: String
    let releaseDate: String
    let asyncImage: AsyncImageView
    
    init(_ spotifySong: SpotifyItem) {
        self.id = spotifySong.track.id
        self.title = spotifySong.track.name
        self.artists = Song.createArtistsString(using: spotifySong)
        self.imageLink = Song.createImageLinkString(using: spotifySong)
        self.albumTitle = spotifySong.track.album.name
        self.releaseDate = spotifySong.track.album.release_date
        self.asyncImage = AsyncImageView(link: imageLink, style: .songCard, tryAgain: true)
    }
    
    static private func createArtistsString(using spotifySong: SpotifyItem) -> String {
        var artistString = ""
        for artist in spotifySong.track.artists {
            artistString.append(artist.name + " ")
        }
        return artistString
    }
    
    static private func createImageLinkString(using spotifySong: SpotifyItem) -> String {
        let images = spotifySong.track.album.images
        return !images.isEmpty ? images[0].url : ""
    }
}

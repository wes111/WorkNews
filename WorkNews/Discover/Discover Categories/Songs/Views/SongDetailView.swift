//
//  SongDetailView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 6/24/22.
//

import SwiftUI

struct SongDetailView: View {
    
    let song: Song
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImageView(link: song.imageLink, style: .songDetail, tryAgain: true)
                    .padding()
                Text(song.title)
                Text(song.albumTitle)
                Text(song.artists)
                Text(song.releaseDate)
                
                Text("Link: ")
            }
        }
    }
}

//let id: String
//let title: String
//let artists: String
//let imageLink: String
//let albumTitle: String
//let releaseDate: String
//let asyncImage: AsyncImageView

struct SongDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SongDetailView(song: Song(SpotifyItem(track: SpotifyItem.Track(id: "1", album: SpotifyItem.Track.Album(images: [SpotifyItem.Track.Album.Image(url: "a URL")], name: "An Album", release_date: "Yesterday"), name: "A Track", artists: [SpotifyItem.Track.Artist(name: "A Singer")]))))
    }
}

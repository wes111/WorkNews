//
//  DiscoverMusicScrollView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/16/22.
//

import SwiftUI

struct DiscoverMusicScrollView: View {
    let musicArray =
    [
        Song(image: Image(systemName: "music.mic")),
        Song(image: Image(systemName: "music.mic")),
        Song(image: Image(systemName: "music.mic")),
        Song(image: Image(systemName: "music.mic")),
        Song(image: Image(systemName: "music.mic")),
        Song(image: Image(systemName: "music.mic")),
        Song(image: Image(systemName: "music.mic")),
        Song(image: Image(systemName: "music.mic")),
        Song(image: Image(systemName: "music.mic")),
        Song(image: Image(systemName: "music.mic"))
    ]
        
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(musicArray) { song in
                    SongCard(song: song)
                        .padding(.leading, 10)
                }
            }
        }
    }
}

struct DiscoverMusicScrollView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverMusicScrollView()
    }
}

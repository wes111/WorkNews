//
//  SongCard.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/16/22.
//

import SwiftUI

struct SongCard: View {
    
    let song: Song
    
    var body: some View {
        VStack {
            Text(song.title)
            Text(song.artists)
        }
        
    }
}

//struct SongCard_Previews: PreviewProvider {
//    static var previews: some View {
//        SongCard(song: Song(SpotifyItem(track: SpotifyItem.init(track: Track()))))
//    }
//}

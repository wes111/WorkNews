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
        song.image
            .resizable()
            .frame(width: 50, height: 50)
    }
}

struct SongCard_Previews: PreviewProvider {
    static var previews: some View {
        SongCard(song: Song(image: Image(systemName: "music.mic")))
    }
}

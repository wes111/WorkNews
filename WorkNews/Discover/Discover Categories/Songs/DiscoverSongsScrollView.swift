//
//  DiscoverMusicScrollView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/16/22.
//

import SwiftUI

struct DiscoverSongsScrollView: View {
    
    @ObservedObject var model: SongsViewModel
    private let itemCount = 10
        
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<itemCount, id:\.self) { index in
                    if model.songsList.count > index {
                        SongCard(song: model.songsList.elements[index].value)
                    }
                }
            }
        }
    }
}

// MARK: - Preview
struct DiscoverMusicScrollView_Previews: PreviewProvider {
    
    struct DiscoverMusicScrollViewPreview: View {
        @ObservedObject var model = SongsViewModel()
        
        var body: some View {
            DiscoverSongsScrollView(model: model)
        }
    }
    
    static var previews: some View {
        DiscoverMusicScrollViewPreview()
    }
}

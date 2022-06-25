//
//  SongsListView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 6/25/22.
//

import SwiftUI

struct SongsListView: View {
    @ObservedObject var model: SongsViewModel
    
    let columns = [
        GridItem(.adaptive(minimum: SongConstants.songCardWidth), spacing: 10)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(0..<model.songsList.count, id:\.self) { index in
                    SongCard(song: model.songsList.elements[index].value)
                        .padding(.leading, 10)
                }
            }
        }
        .padding(20)
    }
}

//struct SongsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SongsListView()
//    }
//}

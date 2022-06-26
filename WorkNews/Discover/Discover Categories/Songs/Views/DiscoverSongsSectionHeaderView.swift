//
//  DiscoverSongsSectionHeaderView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 6/25/22.
//

import SwiftUI

struct DiscoverSongsSectionHeaderView: View {
    
    @ObservedObject var model: SongsViewModel
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
            Spacer()
            NavigationLink(destination: SongsListView(model: model)) {
                Image(systemName: "arrow.forward")
                    .modify(using: .systemForward)
            }
        }
        .textCase(nil)
        .foregroundColor(.black)
    }
}
//
//struct DiscoverSongsSectionHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        DiscoverSongsSectionHeaderView()
//    }
//}

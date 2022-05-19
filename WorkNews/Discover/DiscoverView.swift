//
//  DiscoverView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/16/22.
//

import SwiftUI

struct DiscoverView: View {
    var body: some View {
        List {
            Section(header: Text("Books")) {
                DiscoverBooksScrollView()
            }
            Section(header: Text("Movies")) {
                DiscoverMoviesScrollView()
            }
            Section(header: Text("Music")) {
                DiscoverMusicScrollView()
            }
            Section(header: Text("Magazines")) {
                DiscoverMagazinesScrollView()
            }
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}

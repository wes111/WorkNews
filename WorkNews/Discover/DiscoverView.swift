//
//  DiscoverView.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 5/16/22.
//

import SwiftUI

struct DiscoverView: View {
    
    @StateObject var bookVM = BooksViewModel()
    @StateObject var songsVM = SongsViewModel()
    
    var body: some View {
        List {
            Section {
                DiscoverBooksScrollView(model: bookVM)
            } header: {
                DiscoverSectionHeaderView(
                    model: bookVM,
                    navigationAction: {
                        bookVM.googleBookFetcher.tryToFetchAllBooks()
                    },
                    title: "Books")
            }
            
            Section {
                DiscoverMoviesScrollView()
            } header: {
                DiscoverSectionHeaderView(
                    model: bookVM,
                    navigationAction: {
                        print("place holder")
                    },
                    title: "Movies")
            }

            Section {
                DiscoverSongsScrollView(model: songsVM)
            } header: {
                DiscoverSectionHeaderView(
                    model: bookVM,
                    navigationAction: {
                        print("place holder")
                    },
                    title: "Music")
            }

            Section {
                DiscoverMagazinesScrollView()
            } header: {
                DiscoverSectionHeaderView(
                    model: bookVM,
                    navigationAction: {
                        print("place holder")
                    },
                    title: "Magazines")
            }
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}

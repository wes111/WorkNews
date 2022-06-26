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
    @StateObject var moviesVM = MoviesViewModel()
    
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
                DiscoverMoviesScrollView(model: moviesVM)
            } header: {
                DiscoverMoviesSectionHeaderView(
                    model: moviesVM,
                    title: "Movies")
            }

            Section {
                DiscoverSongsScrollView(model: songsVM)
            } header: {
                DiscoverSongsSectionHeaderView(
                    model: songsVM,
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
                    title: "Podcasts")
            }
            
            Section {
                DiscoverMagazinesScrollView()
            } header: {
                DiscoverSectionHeaderView(
                    model: bookVM,
                    navigationAction: {
                        print("place holder")
                    },
                    title: "Articles")
            }
            
            Section {
                DiscoverMagazinesScrollView()
            } header: {
                DiscoverSectionHeaderView(
                    model: bookVM,
                    navigationAction: {
                        print("place holder")
                    },
                    title: "Websites")
            }
            
            Section {
                DiscoverMagazinesScrollView()
            } header: {
                DiscoverSectionHeaderView(
                    model: bookVM,
                    navigationAction: {
                        print("place holder")
                    },
                    title: "Memes")
            }
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}

//
//  SongsViewModel.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 6/20/22.
//

import Foundation
import Combine
import OrderedCollections

class SongsViewModel: ObservableObject {
    @Published var songsList: OrderedDictionary<String, Song> = [:]
    private var subscriptions = Set<AnyCancellable>()
    
    let songFetcher = SpotifySongFetcher()
    
    init() {
        subscribeToSongs()
    }
    
    // Subscribe to songs from the songFetcher.
    private func subscribeToSongs() {
        songFetcher.getMediaListPublisher()
            .sink { spotifyPlaylistModel in
                self.createSongs(from: spotifyPlaylistModel)
            }
            .store(in: &subscriptions)
    }
    
    // Create the published model from the responseModel.
    private func createSongs(from model: SpotifyPlaylistResponseModel?) {
        if let spotifyPlaylist = model?.tracks.items {
            for spotifySong in spotifyPlaylist {
                let song = Song(spotifySong)
                DispatchQueue.main.async {
                    self.songsList[song.id] = song
                }
            }
        }
    }
}

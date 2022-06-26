//
//  SpotifySongFetcher.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 6/20/22.
//
//print("JSON String: \(String(data: data, encoding: .utf8))")

import Combine
import Foundation

struct SongMediaItem: MediaItem {
    typealias ResponseModel = SpotifyPlaylistResponseModel
    typealias API = SpotifyAPI
}

class SpotifySongFetcher: MediaItemFetcher<SongMediaItem> {
   
    private let spotifyTokenSubject = PassthroughSubject<SpotifyAuthenticationResponseModel, Never>()
    
    override init() {
        super.init()
        subscribeToTokenSubject()
        setupSpotifyAuthentication()
    }
    
    private func setupSpotifyAuthentication() {
        let request = api.authenticationRequest
        guard let request = request else { return }
        getAuthenticationToken(using: request)
    }

    private func subscribeToTokenSubject() {
        spotifyTokenSubject.sink { authenticationModel in
            let token = authenticationModel.access_token
            self.api.token = token
            let request = self.api.createMediaListRequest()
            guard let request = request else { return }
            self.getMediaList(using: request)
        }.store(in: &subscriptions)
    }
    
    // Gets the authentication token from the Spotify API.
    private func getAuthenticationToken(using request: URLRequest) {
        makeRequest(using: request) { data in
            let token = try self.decoder
                .decode(SpotifyAuthenticationResponseModel.self, from: data)
            self.spotifyTokenSubject.send(token)
        }
    }
}

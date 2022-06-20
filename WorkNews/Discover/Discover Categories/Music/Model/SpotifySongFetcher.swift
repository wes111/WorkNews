//
//  SpotifySongFetcher.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 6/20/22.
//
//print("JSON String: \(String(data: data, encoding: .utf8))")

import Combine
import Foundation

class SpotifySongFetcher {
    private let decoder = JSONDecoder()
    private let spotifyAPI = SpotifyAPI()
    // This could have an initial value provided from local storage.
    private let spotifyPlaylistSubject = CurrentValueSubject<SpotifyPlaylistResponseModel?, Never>(nil)
    private let spotifyTokenSubject = PassthroughSubject<SpotifyAuthenticationResponseModel, Never>()
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        subscribeToTokenSubject()
    }
    
    func setupSpotifyAuthentication() {
        let request = spotifyAPI.authenticationRequest
        guard let request = request else { return }
        getAuthenticationToken(using: request)
    }
    
    private func subscribeToTokenSubject() {
        spotifyTokenSubject.sink { authenticationModel in
            let token = authenticationModel.access_token
            let request = self.spotifyAPI.createPlaylistRequest(using: token)
            guard let request = request else { return }
            self.getPlaylist(using: request)
        }.store(in: &subscriptions)
    }
    
    // Gets the authentication token from the Spotify API.
    private func getAuthenticationToken(using request: URLRequest) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
            } else if let data = data {
                do {
                    let token = try self.decoder
                        .decode(SpotifyAuthenticationResponseModel.self, from: data)
                    self.spotifyTokenSubject.send(token)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    private func getPlaylist(using request: URLRequest) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error)
            } else if let data = data {
                do {
                    let playlist = try self.decoder
                        .decode(SpotifyPlaylistResponseModel.self, from: data)
                    print(playlist)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}

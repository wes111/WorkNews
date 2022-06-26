//
//  SpotifyAPI.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 6/20/22.
//

import Foundation

protocol AuthenticationRequestable: MediaItemAPI {
    var authenticationRequest: URLRequest? { get }
}

struct SpotifyAPI: AuthenticationRequestable {
    
    private let clientID = "86354afd1b3547eda445190946c65c9b"
    private let clientSecret = "e92010769cd84224949ddb0d436b06c3"
    private let playListID = "2EAuchjDZ8NlnJA3umcK5A"
    private let baseTokenURL = "https://accounts.spotify.com/api/token"
    private let basePlaylistURL = "https://api.spotify.com/v1/playlists"
    private let contentType = "application/x-www-form-urlencoded"

    func createMediaListRequest(using token: String?) -> URLRequest? {
        let urlString = "\(basePlaylistURL)/\(playListID)"
        let url = URL(string: urlString)
        guard let url = url else { return nil }
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        guard let token = token else { return nil }
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        return request
    }
    
    // The request for fetching the authentication token from Spotify.
    var authenticationRequest: URLRequest? {
        let url = URL(string: baseTokenURL)
        guard let url = url else { return nil }
        var request = URLRequest(url: url)
        
        let requestHeaders : [String : String] =
        [
            "Authorization" : createAuthorizationString(),
            "Content-Type" : contentType
        ]
        
        var bodyComponents = URLComponents()
        bodyComponents.queryItems = [URLQueryItem(name: "grant_type", value: "client_credentials")]
        
        request.allHTTPHeaderFields = requestHeaders
        request.httpBody = bodyComponents.query?.data(using: .utf8)
        request.httpMethod = "POST"
        return request
    }
    
    // Creates the base64 header authentication String required by the Spotify API.
    private func createAuthorizationString() -> String {
        let authenticationString = "\(clientID):\(clientSecret)".toBase64()
        return "Basic " + authenticationString
    }
}

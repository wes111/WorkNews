//
//  SpotifyAuthenticationResponseModel.swift
//  WorkNews
//
//  Created by Wesley Luntsford on 6/20/22.
//

import Foundation

// Response model for a Spotify authentication object.
struct SpotifyAuthenticationResponseModel: Decodable {
    let access_token: String
}

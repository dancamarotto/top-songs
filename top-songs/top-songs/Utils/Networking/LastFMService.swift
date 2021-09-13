//
//  LastFMService.swift
//  top-songs
//
//  Created by Danilo Camarotto on 13/09/21.
//

import Foundation

protocol LastFMServiceProtocol {
    var baseUrl: String { get set }
    var apiKey: String { get set }
}

struct LastFMService: LastFMServiceProtocol {
    var baseUrl = "https://ws.audioscrobbler.com/2.0"
    var apiKey = "9ee3f2395fca5a7fa2843c0a0238bdc3"
}

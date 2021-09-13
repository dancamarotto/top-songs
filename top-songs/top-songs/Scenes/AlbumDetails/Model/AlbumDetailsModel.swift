//
//  AlbumDetailsModel.swift
//  top-songs
//
//  Created by Danilo Camarotto on 13/09/21.
//

import Foundation

struct AlbumDetailsModel {
    let image: URL?
    let artist: String
    let name: String
    let tracksCount: String
    let publishDate: String
    let listeners: String
    
    init(_ data: AlbumDetailsData) {
        artist = data.album.artist
        name = data.album.name
        tracksCount = "\(data.album.tracks.track.count)"
        publishDate = data.album.wiki.published
        listeners = Int(data.album.listeners)?.withCommas() ?? data.album.listeners
        image = data.album.images
            .first { $0.size == "mega" }
            .map { $0.url }
            .flatMap { URL(string: $0) }
    }
}

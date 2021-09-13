//
//  AlbumInfoData.swift
//  top-songs
//
//  Created by Danilo Camarotto on 13/09/21.
//

import Foundation

struct AlbumInfoData: Decodable {
    let name: String
    let artist: String
    let listeners: String
    let images: [AlbumImageData]
    let wiki: AlbumWikiData
    let tracks: AlbumTracksData
    
    enum CodingKeys: String, CodingKey {
        case name, artist, listeners, wiki, tracks
        case images = "image"
    }
}

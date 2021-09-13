//
//  TopAlbumData.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import Foundation

struct TopAlbumData: Decodable {
    let albums: [AlbumData]
    let attributes: TopAlbumAttributesData
    
    enum CodingKeys: String, CodingKey {
        case albums = "album"
        case attributes = "@attr"
    }
}

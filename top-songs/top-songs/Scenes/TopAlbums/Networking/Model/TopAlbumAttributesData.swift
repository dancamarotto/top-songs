//
//  TopAlbumAttributesData.swift
//  top-songs
//
//  Created by Danilo Camarotto on 13/09/21.
//

import Foundation

struct TopAlbumAttributesData: Decodable {
    let totalPages: String
    let totalAlbums: String
    
    enum CodingKeys: String, CodingKey {
        case totalPages
        case totalAlbums = "total"
    }
}

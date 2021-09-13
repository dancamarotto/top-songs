//
//  AlbumData.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import Foundation

struct AlbumData: Decodable {
    let name: String
    let id: String
    let images: [AlbumImageData]
    
    enum CodingKeys: String, CodingKey {
        case name
        case id = "mbid"
        case images = "image"
    }
}

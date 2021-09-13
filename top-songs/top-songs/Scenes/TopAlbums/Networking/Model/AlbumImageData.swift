//
//  AlbumImageData.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import Foundation

struct AlbumImageData: Decodable {
    let url: String
    let size: String
    
    enum CodingKeys: String, CodingKey {
        case url = "#text"
        case size
    }
}

//
//  TopAlbumsData.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import Foundation

struct TopAlbumsData: Decodable {
    let albumData: TopAlbumData
    
    enum CodingKeys: String, CodingKey {
        case albumData = "albums"
    }
}

//
//  TopAlbumsModel.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import Foundation

struct TopAlbumsModel {
    
    var albums: [TopAlbumModel] = []
    var totalPages: Int = 0
    
    mutating func append(_ data: TopAlbumsData) {
        totalPages = Int(data.albumData.attributes.totalPages) ?? 0
        for album in data.albumData.albums {
            let image = album.images
                .first { $0.size == "large" }
                .map { $0.url } ?? ""
            let albumModel = TopAlbumModel(id: album.id, name: album.name, image: image)
            albums.append(albumModel)
        }
    }
    
}

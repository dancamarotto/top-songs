//
//  AlbumDetailsService.swift
//  top-songs
//
//  Created by Danilo Camarotto on 13/09/21.
//

import Foundation
import RxSwift

protocol AlbumDetailsServiceProtocol {
    var network: Networking { get }
    var lastFMService: LastFMServiceProtocol { get }
    
    func fetchAlbumDetails(id: String) -> Single<AlbumDetailsData>
}

class AlbumDetailsService {
    
    let network: Networking
    let lastFMService: LastFMServiceProtocol
    
    init(network: Networking = Network(),
         lastFMService: LastFMServiceProtocol = LastFMService()) {
        self.network = network
        self.lastFMService = lastFMService
    }
    
    private func defaultParams(id: String) -> [String : Any]? {
        RequestParamBuilder()
            .append(key: "method", value: "album.getinfo")
            .append(key: "api_key", value: lastFMService.apiKey)
            .append(key: "mbid", value: id)
            .append(key: "format", value: "json")
            .build()
    }
    
}

extension AlbumDetailsService: AlbumDetailsServiceProtocol {
    func fetchAlbumDetails(id: String) -> Single<AlbumDetailsData> {
        network
            .request(url: lastFMService.baseUrl,
                     parameters: defaultParams(id: id),
                     returnType: AlbumDetailsData.self)
    }
}

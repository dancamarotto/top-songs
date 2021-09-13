//
//  TopAlbumsService.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import Foundation
import RxSwift

protocol TopAlbumsServiceProtocol {
    var network: Networking { get }
    var lastFMService: LastFMServiceProtocol { get }
    
    func fetchTopAlbums(page: Int) -> Single<TopAlbumsData>
}

class TopAlbumsService {
    
    let network: Networking
    let lastFMService: LastFMServiceProtocol
    
    private let paramMethod = ["method" : "tag.gettopalbums"]
    private let paramTag = ["tag" : "hip-hop"]
    private let paramFormat = ["format" : "json"]
    
    init(network: Networking = Network(),
         lastFMService: LastFMServiceProtocol = LastFMService()) {
        self.network = network
        self.lastFMService = lastFMService
    }
    
    private func defaultParams(page: Int) -> [String : Any]? {
        RequestParamBuilder()
            .append(paramMethod)
            .append(paramTag)
            .append(paramFormat)
            .append(key: "api_key", value: lastFMService.apiKey)
            .append(key: "page", value: page)
            .build()
    }
    
}

extension TopAlbumsService: TopAlbumsServiceProtocol {
    func fetchTopAlbums(page: Int) -> Single<TopAlbumsData> {
        network
            .request(url: lastFMService.baseUrl,
                     parameters: defaultParams(page: page),
                     returnType: TopAlbumsData.self)
    }
}

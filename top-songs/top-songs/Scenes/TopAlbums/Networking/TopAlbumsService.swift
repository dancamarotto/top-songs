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
    
    func fetchTopAlbums(page: Int) -> Single<TopAlbumsData>
}

class TopAlbumsService {
    
    let network: Networking
    
    private let baseUrl = "https://ws.audioscrobbler.com/2.0"
    
    private let paramMethod = ["method" : "tag.gettopalbums"]
    private let paramTag = ["tag" : "hip-hop"]
    private let paramApiKey = ["api_key" : "9ee3f2395fca5a7fa2843c0a0238bdc3"]
    private let paramFormat = ["format" : "json"]
    
    init(network: Networking) {
        self.network = network
    }
    
    private func defaultParams(page: Int) -> [String : Any]? {
        RequestParamBuilder()
            .append(paramMethod)
            .append(paramTag)
            .append(paramApiKey)
            .append(paramFormat)
            .append(key: "page", value: page)
            .build()
    }
    
}

extension TopAlbumsService: TopAlbumsServiceProtocol {
    func fetchTopAlbums(page: Int) -> Single<TopAlbumsData> {
        network
            .request(url: baseUrl,
                     parameters: defaultParams(page: page),
                     returnType: TopAlbumsData.self)
    }
}

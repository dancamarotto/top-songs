//
//  TopAlbumsServiceMock.swift
//  top-songsTests
//
//  Created by Danilo Camarotto on 13/09/21.
//

import Foundation
import RxSwift
@testable import top_songs

class TopAlbumsServiceMock: TopAlbumsServiceProtocol {
    var network: Networking
    var lastFMService: LastFMServiceProtocol
    
    private var bundle: Bundle {
        Bundle(for: TopAlbumsServiceMock.self)
    }
    
    init() {
        network = EmptyNetwork()
        lastFMService = LastFMServiceMock()
    }
    
    func fetchTopAlbums(page: Int) -> Single<TopAlbumsData> {
        let path = bundle.path(forResource: "TopAlbumsDataMock", ofType: "json")
        let data = try! Data(contentsOf: URL(fileURLWithPath: path!))
        let result = try! JSONDecoder().decode(TopAlbumsData.self, from: data)
        return Single.just(result)
    }
    
}

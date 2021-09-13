//
//  TopAlbumsCoordinatorMock.swift
//  top-songsTests
//
//  Created by Danilo Camarotto on 13/09/21.
//

import XCTest
@testable import top_songs

class TopAlbumsCoordinatorMock: TopAlbumsCoordinatorProtocol {
    var goToAlbumDetailsExpectation: XCTestExpectation?
    var albumID: String?
    
    func goToAlbumDetails(withID id: String) {
        albumID = id
        goToAlbumDetailsExpectation?.fulfill()
    }
}

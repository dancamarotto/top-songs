//
//  TopAlbumsViewModelTests.swift
//  top-songsTests
//
//  Created by Danilo Camarotto on 13/09/21.
//

import XCTest
import RxSwift
@testable import top_songs

// MARK: - Configuration
class TopAlbumsViewModelTests: XCTestCase {
    var viewModel: TopAlbumsViewModel!
    var coordinator: TopAlbumsCoordinatorMock!
    var service: TopAlbumsServiceProtocol!
    
    override func setUp() {
        coordinator = TopAlbumsCoordinatorMock()
        service = TopAlbumsServiceMock()
        viewModel = TopAlbumsViewModel(coordinator: coordinator, service: service)
        
        viewModel.fetchTopAlbums()
    }
}

extension TopAlbumsViewModelTests {
    func testTopAlbumsListSizeFirstFetch() {
        XCTAssertEqual(viewModel.topAlbumsListSize, 10)
    }
    
    func testTopAlbumsCellData() {
        let dataOne = viewModel.getCellData(forIndex: 0)
        let urlOne = URL(string: "https://lastfm.freetls.fastly.net/i/u/174s/8f42d9835690309e75ed103361107177.png")
        XCTAssertEqual(dataOne?.title, "My Beautiful Dark Twisted Fantasy")
        XCTAssertEqual(dataOne?.id, "cd7d8c81-d519-4149-8cd0-ade722ad19b9")
        XCTAssertEqual(dataOne?.imageUrl?.absoluteString, urlOne?.absoluteString)
        
        let dataSix = viewModel.getCellData(forIndex: 5)
        let urlSix = URL(string: "https://lastfm.freetls.fastly.net/i/u/174s/ff6b285106a76e5adcb325412149135b.png")
        XCTAssertEqual(dataSix?.title, "808s & Heartbreak")
        XCTAssertEqual(dataSix?.id, "af8fdbd3-dc27-469d-89bf-9167514b3f5e")
        XCTAssertEqual(dataSix?.imageUrl?.absoluteString, urlSix?.absoluteString)
    }
    
    func testDidSelectAlbum() {
        let expectation = XCTestExpectation(description: "go to album details")
        coordinator.goToAlbumDetailsExpectation = expectation
        
        viewModel.didSelectAlbum(withIndex: 2)
        
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(coordinator.albumID, "a63ffa0d-d6f0-4941-9659-8e199ca14a60")
    }
}

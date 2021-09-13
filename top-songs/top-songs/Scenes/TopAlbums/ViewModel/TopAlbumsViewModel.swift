//
//  TopAlbumsViewModel.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import UIKit
import RxSwift

protocol TopAlbumsViewModelProtocol: AnyObject {
    var delegate: TopAlbumsViewControllerDelegate? { get set }
    var topAlbumsListSize: Int { get }
    
    func fetchTopAlbums()
    func getCellData(forIndex index: Int) -> TopAlbumsCellData?
}

struct TopAlbumModel {
    let id: String
    let name: String
    let image: String
}

class TopAlbumsViewModel {
    
    weak var delegate: TopAlbumsViewControllerDelegate?
    weak var coordinator: TopAlbumsCoordinatorProtocol?
    private let service: TopAlbumsServiceProtocol
    
    private let disposeBag = DisposeBag()
    private var topAlbums = TopAlbumsModel()
    private var page = 1
    
    init(coordinator: TopAlbumsCoordinatorProtocol, service: TopAlbumsServiceProtocol) {
        self.coordinator = coordinator
        self.service = service
    }
    
    private func checkDownloadNewData(currentIndex index: Int) {
        let totalDownloaded = topAlbums.albums.count - 1
        let totalPages = topAlbums.totalPages
        if index == totalDownloaded,
           page < totalPages {
            fetchTopAlbums()
        }
    }
}

extension TopAlbumsViewModel: TopAlbumsViewModelProtocol {
    
    var topAlbumsListSize: Int {
        topAlbums.albums.count
    }
    
    func fetchTopAlbums() {
        delegate?.startLoading()
        service
            .fetchTopAlbums(page: page)
            .subscribe { [weak self] topAlbumsData in
                guard let self = self else { return }
                self.delegate?.stopLoading()
                self.page = self.page + 1
                self.topAlbums.append(topAlbumsData)
                self.delegate?.updateTopAlbumsList()
            } onFailure: { [weak self] error in
                self?.delegate?.stopLoading()
                print(error)
            }.disposed(by: disposeBag)
    }
    
    func getCellData(forIndex index: Int) -> TopAlbumsCellData? {
        let album = topAlbums.albums[index]
        let url = URL(string: album.image)
        
        checkDownloadNewData(currentIndex: index)
        
        return TopAlbumsCellData(id: album.id, imageUrl: url, title: album.name)
    }
}

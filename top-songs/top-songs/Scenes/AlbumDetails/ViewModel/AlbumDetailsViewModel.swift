//
//  AlbumDetailsViewModel.swift
//  top-songs
//
//  Created by Danilo Camarotto on 13/09/21.
//

import Foundation
import RxSwift

protocol AlbumDetailsViewModelProtocol {
    func fetchAlbumDetails()
}

class AlbumDetailsViewModel {
    weak var delegate: AlbumDetailsViewControllerDelegate?
    private let service: AlbumDetailsServiceProtocol
    private let id: String
    private let disposeBag = DisposeBag()
    
    init(albumID: String, service: AlbumDetailsServiceProtocol) {
        self.id = albumID
        self.service = service
    }
}

extension AlbumDetailsViewModel: AlbumDetailsViewModelProtocol {
    func fetchAlbumDetails() {
        delegate?.startLoading()
        service
            .fetchAlbumDetails(id: id)
            .subscribe { [weak self] albumDetailsData in
                guard let self = self else { return }
                self.delegate?.stopLoading()
                self.delegate?.setupView(AlbumDetailsModel(albumDetailsData))
            } onFailure: { [weak self] error in
                self?.delegate?.stopLoading()
                print(error)
            }
            .disposed(by: disposeBag)
    }
}

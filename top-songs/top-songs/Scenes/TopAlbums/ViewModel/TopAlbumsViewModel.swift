//
//  TopAlbumsViewModel.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import UIKit

protocol TopAlbumsViewModelProtocol: AnyObject {
    var delegate: TopAlbumsViewControllerDelegate? { get set }
    func fetchTopAlbums()
}

class TopAlbumsViewModel {
    
    weak var delegate: TopAlbumsViewControllerDelegate?
    weak var coordinator: TopAlbumsCoordinatorProtocol?
    private let service: TopAlbumsServiceProtocol
    
    init(coordinator: TopAlbumsCoordinatorProtocol, service: TopAlbumsServiceProtocol) {
        self.coordinator = coordinator
        self.service = service
    }
}

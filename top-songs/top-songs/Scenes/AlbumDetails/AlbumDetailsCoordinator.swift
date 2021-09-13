//
//  AlbumDetailsCoordinator.swift
//  top-songs
//
//  Created by Danilo Camarotto on 13/09/21.
//

import UIKit

class AlbumDetailsCoordinator {
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    let id: String
    
    init(navigationController: UINavigationController, albumID: String) {
        self.navigationController = navigationController
        self.id = albumID
    }
}

extension AlbumDetailsCoordinator: Coordinator {
    func start() {
        let service = AlbumDetailsService()
        let viewModel = AlbumDetailsViewModel(albumID: id, service: service)
        let view = AlbumDetailsViewController(viewModel: viewModel)
        viewModel.delegate = view
        navigationController.pushViewController(view, animated: true)
    }
}

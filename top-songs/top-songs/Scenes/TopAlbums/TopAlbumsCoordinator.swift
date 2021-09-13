//
//  TopAlbumsCoordinator.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import UIKit

protocol TopAlbumsCoordinatorProtocol: AnyObject {
//    func goToAlbumDetails(_ album: AlbumDetailsModel)
    func goToAlbumDetails()
}

class TopAlbumsCoordinator {
    
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
}

extension TopAlbumsCoordinator: Coordinator {
    func start() {
        let service = TopAlbumsService(network: Network())
        let viewModel = TopAlbumsViewModel(coordinator: self, service: service)
        let view = TopAlbumsViewController(viewModel: viewModel)
        viewModel.delegate = view
        navigationController.pushViewController(view, animated: true)
    }
}

extension TopAlbumsCoordinator: TopAlbumsCoordinatorProtocol {
    func goToAlbumDetails() {
        // TODO: - Not implemented yet
    }
}

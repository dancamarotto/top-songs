//
//  TopAlbumsCoordinator.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import UIKit

protocol TopAlbumsCoordinatorProtocol: AnyObject {
    func goToAlbumDetails(withID id: String)
}

class TopAlbumsCoordinator {
    internal var navigationController: UINavigationController
    internal var childCoordinators = [Coordinator]()
    
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
    func goToAlbumDetails(withID id: String) {
        let coordinator = AlbumDetailsCoordinator(navigationController: navigationController, albumID: id)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}

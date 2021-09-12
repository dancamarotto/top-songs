//
//  TopAlbumsViewController.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import UIKit

protocol TopAlbumsViewControllerDelegate: AnyObject {
    
}

class TopAlbumsViewController: UIViewController {
    
    private let viewModel: TopAlbumsViewModelProtocol
    
    private lazy var topAlbumsView: TopAlbumsView = {
        TopAlbumsView(delegate: self)
    }()
    
    init(viewModel: TopAlbumsViewModelProtocol)  {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = "Top Hip-Hop ALbums"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = topAlbumsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchTopAlbums()
    }
    
}

extension TopAlbumsViewController: TopAlbumsViewControllerDelegate {
    
}

extension TopAlbumsViewController: TopAlbumsViewDelegate {
    func getCellData(forIndex index: Int) -> TopAlbumsCellData? {
        // TODO: - Not implemented yet
    }
    
    func didSelectAlbum(atIndex index: Int) {
        // TODO: - Not implemented yet
    }
}

//
//  TopAlbumsViewController.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import UIKit

protocol TopAlbumsViewControllerDelegate: AnyObject {
    func updateTopAlbumsList()
    func startLoading()
    func stopLoading()
}

class TopAlbumsViewController: UIViewController {
    
    private let viewModel: TopAlbumsViewModelProtocol
    
    private lazy var topAlbumsView: TopAlbumsView = {
        TopAlbumsView(delegate: self)
    }()
    
    init(viewModel: TopAlbumsViewModelProtocol)  {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = "Top Hip-Hop Albums"
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
    func updateTopAlbumsList() {
        topAlbumsView.updateTopAlbumsList()
    }
}

extension TopAlbumsViewController: TopAlbumsViewDelegate {
    func getCollectionSize() -> Int {
        viewModel.topAlbumsListSize
    }
    
    func getCellData(forIndex index: Int) -> TopAlbumsCellData? {
        viewModel.getCellData(forIndex: index)
    }
    
    func didSelectAlbum(atIndex index: Int) {
        // TODO: - Not implemented yet
    }
}

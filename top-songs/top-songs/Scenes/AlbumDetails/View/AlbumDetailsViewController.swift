//
//  AlbumDetailsViewController.swift
//  top-songs
//
//  Created by Danilo Camarotto on 13/09/21.
//

import UIKit

protocol AlbumDetailsViewControllerDelegate: AnyObject {
    func setupView(_ albumDetails: AlbumDetailsModel)
    func startLoading()
    func stopLoading()
}

class AlbumDetailsViewController: UIViewController {
    
    private let viewModel: AlbumDetailsViewModelProtocol
    
    private lazy var albumDetailsView: AlbumDetailsView = {
        AlbumDetailsView()
    }()
    
    init(viewModel: AlbumDetailsViewModelProtocol)  {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = "Album Details"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = albumDetailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchAlbumDetails()
    }
    
}

extension AlbumDetailsViewController: AlbumDetailsViewControllerDelegate {
    func setupView(_ albumDetails: AlbumDetailsModel) {
        albumDetailsView.setupView(albumDetails)
    }
}

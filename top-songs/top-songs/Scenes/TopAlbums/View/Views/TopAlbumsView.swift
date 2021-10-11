//
//  TopAlbumsView.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import UIKit

protocol TopAlbumsViewDelegate: AnyObject {
    func getCollectionSize() -> Int
    func getCellData(forIndex index: Int) -> TopAlbumsCellModel?
    func didSelectAlbum(atIndex index: Int)
}

class TopAlbumsView: UIView {
    
    weak var delegate: TopAlbumsViewDelegate?
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.register(TopAlbumsCell.self, forCellWithReuseIdentifier: TopAlbumsCell.reuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    convenience init(delegate: TopAlbumsViewDelegate? = nil) {
        self.init(frame: .zero)
        self.delegate = delegate
        setupViewCode()
    }
    
    func updateTopAlbumsList() {
        collectionView.reloadData()
    }
    
}

extension TopAlbumsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        delegate?.getCollectionSize() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
                .dequeueReusableCell(withReuseIdentifier: TopAlbumsCell.reuseIdentifier,
                                     for: indexPath) as? TopAlbumsCell else {
            fatalError("Unable to dequeue \(TopAlbumsCell.reuseIdentifier)")
        }
        let cellData = delegate?.getCellData(forIndex: indexPath.row)
        cell.setupCell(with: cellData)
        return cell
    }
}

extension TopAlbumsView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectAlbum(atIndex: indexPath.row)
    }
}

extension TopAlbumsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 10
        let collectionViewSize = collectionView.frame.size.width - padding
        let size = collectionViewSize / 2 - 10
        return CGSize(width: size, height: size)
    }
}

extension TopAlbumsView: ViewCoded {
    func addViews() {
        addSubview(collectionView)
    }
    
    func addConstraints() {
        addConstraints([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
    
    func setupViews() {
        backgroundColor = .white
    }
}

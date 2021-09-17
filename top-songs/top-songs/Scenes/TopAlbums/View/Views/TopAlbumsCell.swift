//
//  TopAlbumsCell.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import UIKit
import Kingfisher

class TopAlbumsCell: UICollectionViewCell {
    
    static let reuseIdentifier = "topAlbumsCell"
    private var data: TopAlbumsCellData?
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
        self.label.text = nil
    }
    
    func setupCell(with data: TopAlbumsCellData?) {
        self.data = data
        setupViewCode()
    }
    
}

extension TopAlbumsCell: ViewCoded {
    func addViews() {
        addSubview(imageView)
        addSubview(label)
    }
    
    func addConstraints() {
        addConstraints([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            label.topAnchor.constraint(equalToSystemSpacingBelow: imageView.bottomAnchor, multiplier: 0),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
    
    func setupViews() {
        imageView.kf.setImage(with: data?.imageUrl)
        label.text = data?.title
    }
}

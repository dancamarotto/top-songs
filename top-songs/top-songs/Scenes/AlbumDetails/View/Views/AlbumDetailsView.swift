//
//  AlbumDetailsView.swift
//  top-songs
//
//  Created by Danilo Camarotto on 13/09/21.
//

import UIKit

class AlbumDetailsView: UIView {
    
    private let fontRegular = "Avenir Next"
    private let fontBold = "Avenir Next Bold"
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var albumNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: fontRegular, size: 26)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: fontBold, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tracksCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: fontRegular, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var publishDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: fontRegular, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var listenersLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: fontRegular, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    convenience init() {
        self.init(frame: .zero)
        setupViewCode()
    }
    
    func setupView(_ albumDetails: AlbumDetailsModel) {
        imageView.kf.setImage(with: albumDetails.image)
        albumNameLabel.text = albumDetails.name
        artistLabel.text = albumDetails.artist
        tracksCountLabel.text = "Number of tracks: \(albumDetails.tracksCount)"
        publishDateLabel.text = "Publish date: \(albumDetails.publishDate)"
        listenersLabel.text = "Listeners: \(albumDetails.listeners)"
    }
    
}

extension AlbumDetailsView: ViewCoded {
    func addViews() {
        addSubview(imageView)
        addSubview(albumNameLabel)
        addSubview(artistLabel)
        addSubview(tracksCountLabel)
        addSubview(publishDateLabel)
        addSubview(listenersLabel)
    }
    
    func addConstraints() {
        addConstraints([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            
            albumNameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            albumNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            albumNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            artistLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 5),
            artistLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            artistLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            tracksCountLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 20),
            tracksCountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            tracksCountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            publishDateLabel.topAnchor.constraint(equalTo: tracksCountLabel.bottomAnchor, constant: 8),
            publishDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            publishDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            listenersLabel.topAnchor.constraint(equalTo: publishDateLabel.bottomAnchor, constant: 8),
            listenersLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            listenersLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
        ])
    }
    
    func setupViews() {
        backgroundColor = .white
    }
}

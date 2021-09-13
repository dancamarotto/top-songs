//
//  ViewCoded.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import Foundation

/// The `ViewCoded` protocol is used to implement the views of the scenes.
/// Since we do not use `Storyboards`, all the views are implemented programatically.
protocol ViewCoded {
    
    /// Used to add all the necessary views, like buttons or labels.
    func addViews()
    
    /// Used to add all the necessary constraints to organize the view components.
    func addConstraints()
    
    /// Used to add any additional information.
    func setupViews()
    
    /// Already has a default implementation, just need to be called once in your `UIView` so all functions above are called.
    func setupViewCode()
}

extension ViewCoded {
    func setupViewCode() {
        addViews()
        addConstraints()
        setupViews()
    }
}

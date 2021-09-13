//
//  UIViewController+Loading.swift
//  top-songs
//
//  Created by Danilo Camarotto on 12/09/21.
//

import UIKit
import PKHUD

extension UIViewController {
    /// Show loading over the entire screen.
    func startLoading() {
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
    }
    
    /// Hide the loading called on `showLoading` function.
    func stopLoading() {
        PKHUD.sharedHUD.hide(true)
    }
    
    /// Presentes a default error message on the bottom of the screen.
    /// - Parameter message: A custom message to show to the user.
    func showDefaultError(withMessage message: String) {
        let title = "An error occurred :("
        let actionSheet = UIAlertController(title: title,
                                            message: message,
                                            preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        actionSheet.addAction(okAction)
        DispatchQueue.main.async {
            self.present(actionSheet, animated: true)
        }
    }
}

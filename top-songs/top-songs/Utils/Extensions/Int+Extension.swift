//
//  Int+Extension.swift
//  top-songs
//
//  Created by Danilo Camarotto on 13/09/21.
//

import Foundation

extension Int {
    func withCommas() -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value:self))
    }
}

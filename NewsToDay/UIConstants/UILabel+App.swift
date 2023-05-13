//
//  UILabel+App.swift
//  NewsToDay
//
//  Created by Владислав on 09.05.2023.
//

import UIKit

extension UILabel {
    
    convenience init(text: String = "", font: UIFont?, textColor: UIColor) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.adjustsFontSizeToFitWidth = true
    }
}

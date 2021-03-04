//
//  ImageViewExtention.swift
//  Test Task Catch Cashback
//
//  Created by Dmitry Sachkov on 04.03.2021.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(imageUrl: String) {
        self.kf.setImage(with: URL(string: imageUrl))
    }
}

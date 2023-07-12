//
//  UIView+Extension.swift
//  SMBBusinessCard
//
//  Created by Apinun on 11/7/2566 BE.
//

import UIKit

extension UIView {
    public func setViewShadow() {
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowRadius = 4.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.masksToBounds = false
    }
}

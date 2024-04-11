//
//  UIView+Extension.swift
//  Homework-5.2
//
//  Created by Андрей Неверовский on 4.04.24.
//

import UIKit

extension UIView {
    
    func rounded() {
        self.layer.cornerRadius = self.frame.size.width / 2
    }
    
    func roundCorners(radius: CGFloat = 15) {
        self.layer.cornerRadius = radius
    }
}

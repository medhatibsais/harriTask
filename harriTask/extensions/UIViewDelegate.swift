//
//  UIViewDelegate.swift
//  harriTask
//
//  Created by Medhat Ibsais on 1/6/20.
//  Copyright © 2020 Medhat Ibsais. All rights reserved.
//

import UIKit

/// UIView
extension UIView {
    
    /**
     Round Corners
     */
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
    let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    
        let mask = CAShapeLayer()
        mask.frame = bounds
        mask.path = path.cgPath
        layer.mask = mask
    }
}

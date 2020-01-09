//
//  DesignableImageView.swift
//  harriTask
//
//  Created by Medhat Ibsais on 10/14/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableImageView: UIImageView {
    
    @IBInspectable
    var cornerRadius : CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
        
    }
}

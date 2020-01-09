//
//  DesignableUIView.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/26/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableUIView: UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        
        didSet {
            
            layer.cornerRadius = cornerRadius
        }
    }
}

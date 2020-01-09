//
//  DynamicHeightCollectionView.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/29/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// Dynamic Height Collection View
class DynamicHeightCollectionView: UICollectionView {
    
    /**
     Layout Subviews
     */
    override func layoutSubviews() {
        super.layoutSubviews()
    
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    /// Intrinsic Content Size
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
}

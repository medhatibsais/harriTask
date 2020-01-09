//
//  CheckSkillsCollectionCell.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/29/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// Check Skills Collection Cell
class CheckSkillsCollectionCell: UICollectionViewCell {

    /**
     Prepare For Reuse
     */
    override func prepareForReuse() {
        super.prepareForReuse()
        
        for eachView in subviews {
            eachView.removeFromSuperview()
        }
    }
    
    /**
     Get Cell Height
     */
    static func getCellHeight() -> CGFloat{
        return 100
    }
    
    /**
     Get Reusable Identifier
     */
    static func getReusableIdentifier() -> String{
        return "skillCollectionCell"
    }
    
    
}

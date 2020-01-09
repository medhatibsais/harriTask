//
//  AboutCellRepresentablesImplementation.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/26/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// About Cell Representables Implementation
class AboutCellRepresentablesImplementation: AboutCellRepresentables {
    
    /// Cell Height
    var cellHeight: CGFloat
    
    /// Cell Reuse Identifier
    var cellReuseIdentifier: String
    
    /// About User
    var aboutUser: String
    
    /**
     Initializer
     */
    init(aboutUser: String) {
        
        cellHeight = AboutCell.getCellHeight()
        cellReuseIdentifier = AboutCell.getReusableIdentifier()
        self.aboutUser = aboutUser
    }
    
    
    /// About User Text
    var aboutUserText: NSMutableAttributedString {
        
        let aboutUserAttributedString = NSMutableAttributedString(string: aboutUser, attributes: [NSMutableAttributedString.Key.font: UIFont(name: "OpenSans", size: 13)!,NSMutableAttributedString.Key.foregroundColor: UIColor.black])
        
        return aboutUserAttributedString
    }
    
}
